import { combineReducers } from 'redux'
import { reducer as HomeReducer } from '../pages/home/store'
import { reducer as AboutReducer } from '../pages/about/store'


const reducer = combineReducers({
  home: HomeReducer,
  about: AboutReducer
})

export default reducer