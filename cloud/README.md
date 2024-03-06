[Amazon Web Services In Plain English](https://expeditedsecurity.com/aws-in-plain-english/)

[The Amazon Premium](https://calpaterson.com/amazon-premium.html)

[Fabric is a high level Python library designed to execute shell commands remotely over SSH, yielding useful Python objects in return](http://www.fabfile.org/)

[Ansible is an IT automation tool](https://docs.ansible.com/ansible/latest/index.html)

[Cloud Application Hosting for Developers | Render](https://render.com/) - build, deploy, and scale your apps with unparalleled ease – from your first user to your billionth.

[Supabase](https://supabase.com/) - start your project with a Postgres database, Authentication, instant APIs, Edge Functions, Realtime subscriptions, Storage, and Vector embeddings.

[How I run my servers](https://blog.wesleyac.com/posts/how-i-run-my-servers)

Programs that require a database use SQLite, which means that the entire state of the app is kept in a single file. I have two redundant backup solutions: On a daily basis, a backup is taken via the SQLite .backup command, and saved to Tarsnap. The script to do so is run via cron. 

I also use Litestream to stream a copy of the database to DigitalOcean Spaces storage on a secondly basis, with snapshots taken every 6 hours. This gives me quite a lot of confidence that even in the most disastrous of cases, I'm unlikely to lose a significant amount of data, and if I wanted to be more sure, I could crank up the frequency of the Tarsnap backups.
