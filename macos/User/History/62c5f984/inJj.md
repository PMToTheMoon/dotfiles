# Pages
There is two different kind of page static and dynamic page.

static page have routes and should be registered to app using MaterialApp's routes property.
dynamic page are generated on the fly. They can take argument and return value.

## Static page
```dart
class HomePage extends StatelessWidget {
  static const route = 'home';

  static HomePage builder(BuildContext context) => HomePage();
}
``` 
## dynamic page
```dart

class UserViewPageArgs {}
class UserViewPageResult {}

class UserViewPage extends StatelessWidget {
  static Future<userViewPageResult> open(
    BuildContext context,
    UserViewPageArgs args,
  ) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UploadDocumentPage._(args),
      ),
    );
    return result as UserViewPageResult;
  }

  UploadDocumentPage._(this.args);

  final UserViewPageArgs;
}
``` 

OLD v
----

Named page are entry point of a standalone page of the application. It always make sense to travel to this page, no matter from where you came. Named page should not carry any argument or return any value. This is the most common type of page. There is no restriction about the number of named page you could create or the size they should have.
Each named page is likely to have it's own bloc so they are independent form each other. Data are shared between page thanks to repositories.
ex: profile, home, list of transactions, ...

in the other hand, unnamed page, or dynamic page are opened for specific needs depending of context. That can be the need for a complex input that need it's separated page, or even for visualizing some data. they should be opened by an other page when it's needed and always takes argument or return value as parameter.
ex: full screen search with proposal selection, full screen visualization of a transaction, ...

