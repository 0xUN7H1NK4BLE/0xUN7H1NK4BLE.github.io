# Northstar Desk XSS Training App

Northstar Desk is a single-file, intentionally vulnerable XSS practice application in `index.html`.
It is designed as a realistic operations console with no backend. Stored data is persisted in
`localStorage`.

## XSS Surface Count

There are 16 intentional XSS surfaces:

| # | Area | Type | Where |
|---|------|------|-------|
| 1 | Dashboard search | Reflected query XSS | `?q=...#dashboard`, rendered in `#querySummary` |
| 2 | Dashboard launch brief | Stored XSS | Dashboard brief form, stored in `localStorage` key `northstar-brief` |
| 3 | Dashboard activity | Stored XSS | `Quick note` modal, rendered in recent activity |
| 4 | Customers account name | Stored XSS | Customers form `Account name`, rendered in accounts table and modal |
| 5 | Customers owner | Stored XSS | Customers form `Owner`, rendered in accounts table and modal |
| 6 | Customers tier | Stored XSS | Imported/modified customer data rendered in accounts table |
| 7 | Customers notes | Stored XSS | Customers form `Notes`, rendered in table and account detail modal |
| 8 | Customers memo preview | DOM XSS with weak bypass filter | `Customer import` modal preview; only `onerror` is replaced |
| 9 | Orders promo memo | Reflected query XSS with partial filtering | `?promo=...#orders`, rendered in `#promoBanner` through `softFilter()` |
| 10 | Orders memo preview | DOM XSS | `Order memo` modal, rendered with `insertAdjacentHTML()` |
| 11 | Knowledge article body | Stored XSS / markdown-style injection | Knowledge form `Body`, rendered through `markdownish()` |
| 12 | Messages chat | Stored XSS | Messages form, rendered in the launch channel |
| 13 | Messages direct share | DOM XSS / JSON preview | Direct Share JSON `title` and `body`, rendered in `#sharePreview` |
| 14 | Reports preview | DOM XSS | Report Builder `title`, `audience`, and `note`, rendered in `#reportPreview` |
| 15 | Campaign hash banner | DOM fragment XSS | `#campaigns?banner=...`, rendered in `#campaignNotice` |
| 16 | Campaign preview/list | DOM + stored XSS | Campaign form preview and saved campaign list |

Additional related sinks exist in:

| Area | Type | Where |
|------|------|-------|
| Profile | Stored XSS | Profile `name`, `title`, `location`, `bio`, and `photo` URL rendered in profile/header |
| Settings general | Stored DOM XSS | Workspace blurb saved and rendered in the sidebar |
| Settings import | DOM + stored XSS | JSON import preview and `deepMerge()` into app state |
| Settings notifications | DOM XSS with incomplete filtering | Notification preview strips angle brackets only from title, not message |
| Window messaging | postMessage DOM XSS | `window.addEventListener("message", ...)` accepts `type: "northstar:integration-preview"` and renders object fields `html`, `payload`, `body`, or `content` in `Settings -> Notifications -> Integration diagnostics` |

## Main Dangerous Sinks

The app intentionally uses unsafe rendering patterns throughout `index.html`, including:

- `innerHTML`
- `insertAdjacentHTML()`
- URL query parsing with `URLSearchParams`
- hash parsing with `location.hash`
- `localStorage` persistence
- JSON import merged into application state
- `window.message` event rendering
- weak filters such as `softFilter()` and `stripAngle()`

## postMessage Test

Open `Settings -> Notifications`, expand `Integration diagnostics`, then run this in the
browser console:

```js
postMessage({
  type: "northstar:integration-preview",
  html: '<img src=x onerror=alert("postMessage XSS")>'
}, "*");
```

Only the latest integration preview is rendered.


## Resetting Data

Use `Settings -> General -> Reset local data`, or clear browser local storage for the page.
