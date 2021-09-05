import { LightningElement, api, track, wire } from 'lwc';
import findRecords from '@salesforce/apex/LwcLookUpController.findRecords'

const columns = [
    { label: 'ID', fieldName: 'id' },
    { label: 'Product Name', fieldName: 'name' }
];

export default class BasicDatatable extends LightningElement {
    columns = columns;
    lookUpProduct = '';
    @track optionsProduct = [];

    handleInputChange(evt) {
        this.lookUpProduct = evt.target.value;
        console.log(this.lookUpProduct); 
    }

    @wire(findRecords, {searchKey:'$lookUpProduct'})
    retrievedItens({error, data}){
        if(data){
            
            this.optionsProduct = data.product;
        }else if(error){
            console.log(error);
        }
    }

    itemChosed(evt){
        let searchProduct = this.template.querySelector('[data-js="searchProduct"]');
        (searchProduct.value) = (evt.target.outerText);
    }

    addItem(){
            
        
    }
}
