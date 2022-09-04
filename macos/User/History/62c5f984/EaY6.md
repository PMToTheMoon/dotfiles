There is two different kind of page: ~~named and unnamed.~~
static and dynamic page.

OLD v
----

Named page are entry point of a standalone page of the application. It always make sense to travel to this page, no matter from where you came. Named page should not carry any argument or return any value. This is the most common type of page. There is no restriction about the number of named page you could create or the size they should have.
Each named page is likely to have it's own bloc so they are independent form each other. Data are shared between page thanks to repositories.
ex: profile, home, list of transactions, ...

in the other hand, unnamed page, or dynamic page are opened for specific needs depending of context. That can be the need for a complex input that need it's separated page, or even for visualizing some data. they should be opened by an other page when it's needed and always takes argument or return value as parameter.
ex: full screen search with proposal selection, full screen visualization of a transaction, ...

