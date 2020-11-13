import { fromJS } from 'immutable'

const defaultState =fromJS({
  name: 'zhangsan'
})

const reducer = (state = defaultState, action) => {
  switch (action.type) {
    case '':
      break;

    default: 
  }
  return state
}

export default reducer