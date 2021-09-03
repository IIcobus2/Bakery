import { LightningElement, api } from 'lwc';
import findRecords from '@salesforce/apex/LwcLookUpController.findRecords'

const columns = [
    { label: 'ID', fieldName: 'id' },
    { label: 'Product Name', fieldName: 'name' }
];

export default class BasicDatatable extends LightningElement {
    product = [];
    columns = columns;
    queryTerm = [];

    handleKeyUp(evt) {
        const isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            findRecords({searchKey: evt.target.value})
            .then((result)=>{
                // console.log(result);
                if(result.length === 0){
                    this.queryTerm = 'There is not product with this name!';
                }else{
                    this.queryTerm = result;
                    console.log(this.queryTerm);
                }
                
            })
            .catch((error)=>{
                this.queryTerm = [];
                console.log(error);
            })
            // this.queryTerm = evt.target.value;
        }
    }

    addItem(){
        this.product[0] = this.queryTerm;
        console.log(this.product);
        
    }

    async connectedCallback() {
        
    }
}
