Talk Talk
2017-02-15

# DNAinfo Mobile App
"Understanding ES6, React, React Native & Redux"

## Intros
**Vincent Limjap**
* overview guy
* front end
* web apps for 15 yrs

**Tim Buckley**
* technical guy
* 3yrs developer, 5yrs finance, hated finance, did a boot camp, loving it

## Vincent general tips
* Submit a lot of resumes
* Get something out of every interview
    * Say you don't know if you don't
    * Remember good questions
* Some people stay with a company longer than others as developers, some hop around a lot, some stay in one place

## Tim general tips
On company size - in a big company you'll go pretty deep in a specific area, but in a smaller company you get to see and touch more, and get a better idea of the whole picture.

## Both general tips
* Generally write code for readability over speed. Speed is important but readability is generally more important.

## ES6
* Next version of JS
* Mostly add nice syntax stuff
* Works with React Native well

### Arrow functions
```js
let fnName = (param1, param2) = {return param1 + param2;}
```
* `this` keyword binding doesn't change

### `const` and `let`
* `const` throws an error if you try to reassign, block scoped
* `let` - block scoped
* `var` - function scoped, declarations hoisted

### Default Parameters
```js
//ES5
function foo(x, y){
    return x;
}

//ES6
function foo(x = 2, y = "hello"){
    return x;
}
```

### Spread Operator
```js
const myObj = {a:1, b:2, c:3, d:4};
const newObj = { ...myObj, d:40, e:50};
//newObj = {a:1, b:2, c:3, d:40, e:50};

const letters = ['b', 'c', 'd'];
const newLetters = ['a', ...letters, 'e'];
//newLetters = ['a', 'b', 'c', 'd', 'e'];
```
**What's the big benefit?**

We can avoid mutation by doing stuff like this, preserving old objects. Less mutation makes code easier to understand.

### Desctructuring
```js
const numbers = [1, 2, 3, 4, 5];
const [first, second, ...remaining] = numbers;
//first = 1
//second = 2
//remaining = [3, 4, 5]

const position = {lat:42, lng:17, alt:100};
const {lat:latitude, lng:longitude} = position;
//latitude = 42

let printTup = ({elem1, elem2}) => {
    return elem1
}
myObj = {"hey", "there"};
//printTup(myObj) = "hey"
```

### Import/Export
* `export` keyword can go before functions and some other cool places

==I missed some good code here, look it up==

### Classes
* Somewhat controversial
* There's kinda classes now

In prototypical inheritance, the base stays, and an extension is added with the new properties and stuff. With the classes the new object creates a new thing, copying the base then extending it.

### Generator Functions
* "Pausable", `yield` returns a generator object

```js
function* idMaker(){
    let i = 0;
    while(i < 3){
        yield i++
    }
    return 'No more IDs';
}
```
Why? Async code written like sync code

```js
function* getRecentUsername(){
    const items = yield fetchRecentItems();
    return items;

}
console.log(genWrapper(getRecentUsernames()))
```

### Async function
```js
asynch function getRecentUsernames(){
    const items = await fetchRecentItems();
    return items;
}
```

## React
* FB library for building UIs
* V of MVC
* Simplifies UI into `(state) => ui`
* Virtual DOM to efficiently make changes

### JSX
```
const List = (items) => (
    <ul>
        {items.map(i => <ListItem item={i} />}
    </ul>
)
const ListItem = ({text, onClick}) => (
    <li onClick={() => onClick()}>
    {text}
    </li>
    )
```
Then we can send it through Babel to turn it into normal JS, while also doing whatever else we want (bundling, optimizing, etc).

## React Native
Let's you make apps the same way, and then they pretty much just work for mobile devices

## Redux
* State management
* Not MVC style, closer to functional programming
* Most popular state management library for React (more than FB's Flux)

### 3 pieces
* **Store** - the object representing the state, "single source of truth"
    * You can always see the whole state of the app by checking this out
* **Actions** - events/user interactions that change the app
* **Reducers** - transform current state into new state

#### Store
Component subscribe to the store, and know to re-render when the store changes

#### Actions
JS object, must have a `type` property

#### Reducers
The *only* way to change the state

`(currState, action) => newState`

Why not just change state directly? It's really bad to have a global mutable state. It becomes way harder to keep track of what's going on and to predict what happens.

## React + Redux

Redux: Action =>
Redux: Reducer =>
Redux: Store =>

React: View =>
React: UI =>
Redux: Action

And loop

Everything goes in one direction, so it's easy to track.

## Random stuff

Tim: Small-ish companies can be good because you get the breadth of work from a startup without the stress. You can still have influence without as much responsibility.

nyjavascriptmeetup.comp
node school? - tim
