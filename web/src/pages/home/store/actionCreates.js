import { EXCHANGE_FROMTO, HIGHSPEED_TOGGLE } from './constant'

export const exchange = () => ({
  type: EXCHANGE_FROMTO
})

export const speedtoggle = () => ({
    type: HIGHSPEED_TOGGLE
})