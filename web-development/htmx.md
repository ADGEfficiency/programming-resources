[Less htmx is More](https://unplannedobsolescence.com/blog/less-htmx-is-more/) - [Less Htmx Is More | Hacker News](https://news.ycombinator.com/item?id=43619581)

Use htmx minimally - treating it as a library rather than a framework

hx-boost should generally be avoided
- Converts regular links to "boosted" links that replace page content without full navigation
- Creates problems with back button, page refreshes, and JavaScript state management

Cache headers can provide many benefits promised by hx-boost
- Set cache control headers to reuse CSS and JS across page loads
- Use versioned URLs for resources to control caching behavior
- Browser optimization for same-origin links already provides smooth transitions

[htmx, Rust & Shuttle: A New Rapid Prototyping Stack](https://www.shuttle.rs/blog/2023/10/25/htmx-with-rust)

[Splitting Your Data & Application APIs: Going Further](https://htmx.org/essays/splitting-your-apis/)

Needs for a generic API:

    How to predict and enable all possible workflows
    How to avoid N+1 requests for awkward workflows
    How to test functionality, performance, and security of every possible request
    How to change the API without breaking the existing workflows
    How to prioritize API changes between internal and community requirements
    How to document everything so that all parties can get stuff done

Needs for a application API:

    How to collect all the data needed to render a page
    How to optimize requests to multiple endpoints
    How to avoid using API data fields in unintended ways
    How to weigh the benefit of new features against the cost of new API requests

This misalignment of needs the Data/App API Impedance Mismatch problem.

Max’s recommendation is to split the API into two “halves”: a generic API and an application API:

    I suggest you stop treating your frontend as some generic API client, and start treating it as a half of your app.

    Imagine if you could just send it the whole “page” worth of JSON. Make an endpoint for /page/a and render the whole JSON for /page/a there. Do this for every page. Don’t force your front-end developers to send a bunch of individual requests to render a complex page. Stop annoying them with contrived limitations. Align yourselves.

[HTMX is the Future](https://quii.dev/HTMX_is_the_Future)

[Two Approaches To Decoupling](https://htmx.org/essays/two-approaches-to-decoupling/)

Two different types of decoupling in the context of web applications:

Decoupling at the application level via a generic JSON Data API
Decoupling at the network architecture level via a hypermedia API

---

Coupling is a property of a software system in which two modules or aspects of the system have a high degree of interdependence. Decoupling software is the act of reducing this interdependence between unrelated modules so that they can evolve independently of one another.

The concept of coupling and decoupling is closely (and inversely) related to cohesion. Highly cohesive software has related logic within a module or conceptual boundary, rather than spread out throughout a codebase. (A related concept is our own idea of Locality of Behavior)

---

And we saw that, despite the tighter application-level coupling found in a hypermedia-based application, it is the hypermedia system that handles changes more gracefully.

[htmx in a Nutshell](https://htmx.org/docs/)

[Htmx in a Nutshell | Hacker News](https://news.ycombinator.com/item?id=33987578)

---

[UX Design Patterns for Loading](https://pencilandpaper.io/articles/ux-pattern-analysis-loading-feedback/)

Loading states are a way to play with users’ perception of time and turn it to your advantage.

Loading indicators are all about balancing perceived time and perceived value. 

Loading states are also a good opportunity to set expectations of users in your product. They can be used as a communication device to reduce uncertainty for the user by explaining what’s happening or preparing them for what’s coming up next.
