import { fromJS } from 'immutable'
import { EXCHANGE_FROMTO } from './constant'

const defaultState =fromJS({
  from: '北京',
  to: '杭州'
})

const reducer = (state = defaultState, action) => {
  switch (action.type) {
    case EXCHANGE_FROMTO:
      const to = state.get('to')
      const from = state.get('from')
      return state.merge({
        to: fromJS(from),
        from: fromJS(to)
      })
    default: 
  }
  return state
}

export default reducer