import React, { lazy, Suspense } from 'react'
import { Provider } from 'react-redux'
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import store from './store'

const Home = lazy(() => import('../src/pages/home'))
const About = lazy(() => import('../src/pages/about'))

const App = () => {
  return (
    <Provider store={store}>
      <Suspense fallback={<div>loading</div>}>
        <BrowserRouter>
          <Switch>
            <Route path='/' exact component={Home} />
            <Route path='/about' component={About} />
          </Switch>
        </BrowserRouter>
      </Suspense>
    </Provider>
  )
}

export default App;
