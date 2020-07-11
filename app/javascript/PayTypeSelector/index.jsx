import React from 'react'

import NoPayType from './NoPayType'
import CreditCardPayType from './CreditCardPayType'
import CheckPayType from './CheckPayType'
import PurchaseOrderPayType from './PurchaseOrderPayType'

class PayTypeSelector extends React.Component {
    // onPayTypeSelected = (event)=>{
    //     console.log(event.target.value)
    //     this.setState({ selectedPayType: event.target.value })
    // }
    constructor(props){
        super(props)
        this.onPayTypeSelected = this.onPayTypeSelected.bind(this)
        this.state = { selectedPayType: null}
    }

    onPayTypeSelected(event){
        console.log(event.target.value)
        this.setState({ selectedPayType: event.target.value })
    }
    render(){

        let PayTypeCustomComponent = NoPayType
        let { selectedPayType } = this.state        

        switch (selectedPayType) {
            case "Credit card":
                PayTypeCustomComponent = CreditCardPayType;
                break;
            case "Check":
                PayTypeCustomComponent = CheckPayType;
                break;
            case "Purchase order":
                PayTypeCustomComponent = PurchaseOrderPayType;
                break
            default:
                break;
        }

        return (
            <div>
                <div className="field">
                    <label htmlFor="order_pay_type">Pay type</label>
                    <select id="order_pay_type" name="order[pay_type]" onChange={this.onPayTypeSelected}>
                        <option value="">Select a payment method</option>                    
                        <option value="Check">Check</option>                    
                        <option value="Credit card">Credit card</option>                    
                        <option value="Purchase order">Purchase order</option>                    
                    </select>
                </div>
                <PayTypeCustomComponent />
            </div>
        )
    }
}

export default PayTypeSelector