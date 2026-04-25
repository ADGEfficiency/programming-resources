---
id: apis
aliases: []
tags:
  - api
  - rest
  - http
---

## General

Shadow test of new API - run requests and check output the same

[An introduction to APIs](https://zapier.com/resources/guides/apis)

A course:

1. API introduction
2. API protocols
3. API types and formats
4. API authentication, part 1: Basic vs. key
5. API authentication, part 2: OAuth
6. API design
7. Real-time API communication
8. API implementation

[An Introduction to APIs | Hacker News](https://news.ycombinator.com/item?id=36932537)

Standards work cause everyone understands them. I know a PUT request is almost certainly an update of some kind. I know a POST makes something.

For most shit you wanna do, its view, edit, delete, its really not that complicated.

---

Am I the only one around here who hates the whole PUT PATCH nonsense? When I write APIs, you're either querying data with a GET, or mutating data with a POST. Everything else is a waste of time.

[Zalando RESTful API and Event Guidelines](https://opensource.zalando.com/restful-api-guidelines/)

## REST

Representational State Transfer - clients and servers transferring resources.

### HTTP Verbs

| Verb | Behaviour |
|------|-----------|
| `GET` | Read |
| `PUT` | Create and update (full updates) |
| `POST` | Create and update (partial updates) |
| `DELETE` | Delete |
| `HEAD` | Get info only (not resource) |

### Resources

Two types: `/collections/instance`

**Collection resource** — plural, represents multiple things:
- `/applications`

**Instance resource** — a single item within a collection.

Hierarchical relationship: `employee/status/hourly` (not `employee?status=hourly`)

Use nouns as resource names, keeping them as general as possible.

### URL Design

- Use plural nouns for endpoints
- Keep base URL as small as possible: `http(s)://api.foo.com`
- Use JavaScript notation: `myArray.forEach` not `myArray.for_each`

### Versioning

Two approaches:
1. Embed version in URL (most common): `/v1/resource`
2. Media type versioning: `application&v=1` — app URLs don't need to change

### Media Types

Client uses `Accept` header to specify what they want. `Content-Type` on the returned header can be different.

JSON is taking over from XML.

### Times

Use ISO-8601.

[Designing a REST API: Unix time vs ISO-8601](https://nickb.dev/blog/designing-a-rest-api-unix-time-vs-iso-8601/) — ISO-8601 preferred for REST APIs.

### HREF & Canonical URLs

All resources have an `href` property in the body so clients know how to interact with other resources:

`https://api.stormpath.com/v1/accounts/account_id`

All URLs should be fully qualified canonical URLs.

### Pagination

Use `offset` (position away from zero index) and `limit` (restricts number of results returned).
