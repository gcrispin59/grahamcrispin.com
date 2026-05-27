# GrahamCrispin.com Netlify Rehost — TODO

**Phase 0:** Complete  
**Phase 1:** Complete (repo scaffold)  
**Phase 2:** In progress (Netlify + GitHub)

---

## Phase 2 — Netlify + GitHub

- [ ] **2.1** Netlify site `grahamcrispin` linked to `gcrispin59/grahamcrispin.com`
- [ ] **2.2** Netlify site `www-praetorspectral` linked to `gcrispin59/www-praetorspectral`
- [ ] **2.3** Add custom domain `grahamcrispin.com` + `www.grahamcrispin.com` in Netlify (external DNS)
- [ ] **2.4** Copy Netlify apex A / www CNAME values for GoDaddy Phase 3

## Phase 3 — GoDaddy DNS (web only)

**CHANGE:**

| Host | Type | Action |
|------|------|--------|
| `@` | A | WebsiteBuilder → Netlify apex IP |
| `www` | CNAME | → `grahamcrispin.netlify.app` or `@` |
| `praetorspectral` | CNAME | → `www-praetorspectral.netlify.app` |

**LEAVE ALONE:** MX, SPF TXT, autodiscover, DKIM selectors, Teams SRV/CNAME, NS

**After `/realize/` verified:** remove/repoint `realizebv` A and HubSpot CNAME

## Phase 4 — SSL

- [ ] Certificate issued for apex + www
- [ ] Force HTTPS enabled
- [ ] Primary domain `https://grahamcrispin.com`

## Phase 5 — Post-cutover tests

- [ ] All nav pages load
- [ ] `/realize/` live with LinkedIn link
- [ ] `www.praetorspectral.com` → `praetorspectral.com`
- [ ] Email send/receive `graham@grahamcrispin.com`
- [ ] Teams sign-in unaffected

## Phase 7 — Follow-on

- [ ] **R.1** Redirect LinkedIn link on `/realize/` from personal profile to Realize BV company page; enable Netlify `/realize/linkedin` redirect in `netlify.toml`
- [ ] **7.3c** Replace image placeholders per [REALIZE-IMAGE-BRIEF.md](REALIZE-IMAGE-BRIEF.md)
- [ ] HubSpot form on `/contact`
- [ ] Calendly/HubSpot on `/book`

## Rollback

1. Restore `@` A to WebsiteBuilder Site
2. Restore `www` CNAME to `@`
3. Never delete MX or autodiscover
