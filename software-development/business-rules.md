[Different types of application logic](https://jorzel.github.io/different-types-of-application-logic/)

Feature:

- customer can send vouchers to friends
- when user activates voucher, she becomes customer with some bonus starting points
- voucher sent my email address, but only some domains are OK
- num bonus points depends on user status
- each customer can only send 3
- customer can list sent vouchers, and see which are activated

## Straightfoward Approach

```go
type Voucher struct {
    customer_id string
    points int
    is_active bool
    email string
}

type Customer struct {
    id int
    is_vip bool
}
```
