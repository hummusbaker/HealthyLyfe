# HealthyLyfe

Hello 👋

### Architecture
-using Viper Architecture, why, I've been using it for the last 3 years. also its very testable, and separates everything. tho sometimes an overkill.</br>
  -V: view, basic view that just accepts view model</br>
  -I: interactor, retrieve desired data</br>
  -P: presenter, brains of the screen, connects all the other parts together</br>
  -E: entity, data representation</br>
  -R: router/wireframe, routing/initialization logic</br>


### To Run
-will have to do a `pod install` command inside the project main directory</br>


### Cocopods
-`SnapKit` for autolayout helpers</br>
-`Kingfisher` for extension for UIImageView to download images (I know Alomafire has something, but using Kingfisher cause familiar and to save time)</br>
-`Alomafire` to hit endpoints</br>


### About project
-supports dark mode</br>
-font accessible based on user preference</br>
-app, along with unit tests, runs on iOS 11, and of course, ios 14</br>
-predefined article subjects that are color coated. everything down the article lever uses that subject's color</br>
-used Article API and Books API</br>
-there could have been a dependency manager that was passed that through each wireframe, but opted in for a simple passing of DataService as already pu in a lot of hours into the project</br>


### Home
-shows predefined aritcle topics, along with top advice books based on Books API. books are not interactable tho.</br>
-implemented using a table view. article topics are tableViewCells, books are represented by a stack view inside a tableViewCell</br>


### Browse Article
-shows a list of articles based on a topic passed down to it</br>
-implemented using collectionView, with simple</br>
-weird animation on nav bar when the screen is transitioned into, please ignore. really wanted to include prefersLargeTitles for navigation bars</br>
-opens an in app webview</br>


### WebView
-not implemented using viper, just simple ViewController. totally could be tho.</br>


### Unit Test
-example unit testing of Browse Article presenter. tested when interactor is called, when view configured with view model, and appropriate information based around through each viper components</br>
-can test more, including the interactor level and data models. but choose the presenter test as thought might be the most interesting one</br>

Danke</br>
dawid
