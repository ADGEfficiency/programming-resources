[ClawHub](https://clawhub.ai/)

[docs](https://docs.openclaw.ai)

---

## setup

openclaw onboard
openclaw configure

## use

openclaw gateway status
openclaw status
openclaw health
openclaw security audit --deep
openclaw channels login

## uninstall

openclaw gateway stop
openclaw uninstall

## whatsapp

WhatsApp direct chats are controlled by:
- `channels.whatsapp.dmPolicy`
- `channels.whatsapp.allowFrom`

Policies:
- **pairing** (default): Unknown senders get a pairing code; owner approves.
- **allowlist**: Unknown senders are blocked.
- **open**: Public inbound DMs (requires `allowFrom` to include "*").
- **disabled**: WhatsApp DMs are ignored.

Current settings:
- `dmPolicy=pairing`
- `allowFrom=unset`
