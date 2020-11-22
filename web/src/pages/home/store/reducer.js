import { fromJS } from 'immutable'
import { EXCHANGE_FROMTO, HIGHSPEED_TOGGLE} from './constant'

const defaultState =fromJS({
  from: '北京',
  to: '杭州',
  departDate: Date.now(),
  highSpeed: false
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
    case HIGHSPEED_TOGGLE:
      const highSpeed = !state.get('highSpeed')
      return state.set('highSpeed', highSpeed)
    default: 
  }
  return state
}

export default reducer