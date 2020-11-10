import React, { Component, createContext, PureComponent } from 'react'

const BatteryContext = createContext()

class Features extends Component {

  state = {
    battery: 60,
    own: 20
  }
  handleClick = () => {
    this.setState((prevState) => ({
      battery: prevState.battery + 1
    }))
  }

  childBtnClick =() => {
    console.log(123)
  }

  changeParentOwnProps = () => {
    this.setState((preState) => ({
      own: preState.own +2
    }))
  }

  render () {
    const { battery , own} = this.state
    return (
      <>
        <BatteryContext.Provider value={ battery }>
          <Middle />
        </BatteryContext.Provider>
        { own }
        <button onClick={this.handleClick}>Btn</button>
        <button onClick={this.changeParentOwnProps}>ChangeParentOwnProps</button>
        <Child 
          childBtnClick={ this.childBtnClick }
          battery={battery}
        />
      </>
    )
  }
}

class Child extends PureComponent {
  // shouldComponentUpdate (nextProps, nextState) {
  //   if(nextProps.battery !== this.props.battery) {
  //     return true
  //   }
  //   return false
  // }
  render() {
    console.log('child render!')
    const { battery } = this.props
    const { childBtnClick } = this.props
    return (
      <div style={{ background: 'pink' }}> { battery  }
        <button onClick={childBtnClick}> BTN</button>
      </div>
    )
  }
}

class Middle extends Component {
  render () {
    return <Leaf />
  }
}

class Leaf extends Component {
  static contextType = BatteryContext
  render () {
    const battery = this.context
    return (
      // <BatteryContext.Consumer>
      // { battery => <h1>Battery: {battery}</h1> }
      // </BatteryContext.Consumer>
      <h1>Battery: {battery}</h1>
    )
  } 
}
export default Features