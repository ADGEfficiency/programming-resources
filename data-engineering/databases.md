[42 things I learned from building a production database](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html)

[A terrible schema from a clueless programmer](http://rachelbythebay.com/w/2021/11/06/sql/) [HN Discussion](https://news.ycombinator.com/item?id=29139902)

[Common data model mistakes made by startups](https://www.metabase.com/learn/analytics/data-model-mistakes) [HN Discussion](https://news.ycombinator.com/item?id=27248093)

---

Transactional versus analytical - different read + write patterns

---

Fact + dimension tables

- one a fact table that says what the forecasts are
- two a dimension table that has all the forecasts

---

https://www.reddit.com/r/dataengineering/comments/tqud76/database_design_best_practices_for_data_warehouses/

 If the system supports transactions, I normalize it. If it's for analysis, I get as close to "One Big Table" (obt) as makes sense so analyst don't have to even worry about joins.

denormalize until it hurts, normalize until it makes sense

Are you optimizing forc read or write?

---

How to structure a database for data reingestion (if the data can be uploaded again):

Instead of upserting the data directly into the table, just insert / append the data into some other table(tableA). Now, create a view on top of this table which will pick up the latest record based on the primary keys. Now if you want to update some historical file you just need to update it in tableA. The changes will reflect into the view.

Don't trust the csv name. Get the file timestamp from the storage metadata if you can and use that. 

---

https://www.reddit.com/r/dataengineering/comments/t4et7u/in_your_etl_process_do_you_load_to_a_staging_area/

Landing Zone (LZ):

Data gets loaded here without any data type restrictions as our external sources are very unreliable. This allows us to be able to do validation testing and determine warnings v. failure.

Data Exchange:

This is where we Type 1 data into type restrictive tables (assuming data passes validation) that are setup like the DW tables. Then we can run another set of validations that our transformations worked appropriately as well as understand data that was not loaded from the LZ source.

Data Warehouse:

Data from the Data Exchange layer gets Type 1 into the production tables and another set of data validations occur to ensure the changes presented in the Data Exchange layer match up with the DW.

Data Marts_<business_function>:

The data warehouse then loads to the appropriate data marts for the reporting services and end-user consumption. We have an external reporting mart, finance reporting mart, and operational reporting mart. This is where hard business rules are applied for each mart. Then there is another set of validations to test the hard business rule logic and ensure consistency of values or lack thereof.

Our legacy DW had staging tables, but they were type restrictive. So any changes in the data would cause a failure in the processing. Using the staging allows you to set aside those problematic records and continue processing the rest of the data.

We will probably incorporate some form of an Archive data store because our operational DB changes very quickly and having a snapshot of the data used at time of processing would be great for audits. Our accounting DB and flat files are already archived so we can reload those at any point as well as have an audit trail for them.

This setup allows us to test new soft rules without corrupting/breaking the DW because if it does not pass in the Data Exchange, it won't pass in the DW. It also allows for more robust and faster validation.

I would imagine you could skip a staging and go straight to the DW, but your data validation better be very good. The other problem with skipping the staging area is these data validations could take much longer than splitting them into smaller bits. Also, skipping staging could be risky depending on if you are Type 1 or Type 2. Without staging and a Type 2 environment, this seems too risky when there is a failure.

That is my 2 cents.

---

Upserts are generally a bad idea in big data. If your db/tables are small it may not be a big deal but usually you want to do append-only and deduplicate on read and deduplicate the actual table occasionally, like daily or weekly.
