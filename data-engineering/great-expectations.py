pip install great_expectations

great_expectations init

# this makes the datasources in great_expectations.yml
great_expectations datasource new

great_expectations suite new

---

terms
- datasource
- expectation

---
 Welcome! Now that you have initialized your project, the best way to work with Great Expectations is in this iterative dev loop:

    Let Great Expectations create a simple first draft suite, by running great_expectations suite new.
    View the suite here in Data Docs.
    Edit the suite in a Jupyter notebook by running great_expectations suite edit
    Repeat Steps 2-3 until you are happy with your suite.
    Commit this suite to your source control repository.

great_expectations checkpoint new getting_started_checkpoint

---

https://docs.greatexpectations.io/docs/guides/expectations/creating_custom_expectations/overview/

https://greatexpectations.io/expectations/
