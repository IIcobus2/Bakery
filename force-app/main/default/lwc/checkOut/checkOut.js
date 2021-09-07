import { LightningElement, api, track, wire } from 'lwc';
import findRecords from '@salesforce/apex/LwcLookUpController.findRecords'
import getClient from '@salesforce/apex/LwcLookUpController.getClient'

const columns = [
    { label: 'ID', fieldName: 'id' },
    { label: 'Product Name', fieldName: 'name' }
];

export default class BasicDatatable extends LightningElement {
    columns = columns;
    lookUpProduct = '';
    title = '';
    id = 0;
    @api recordId;
    @track product = '';
    @track searchProduct;
    @track optionsProduct = [];
    @track clientInfo = [];

    

    displayCombobox(){
        this.template.querySelector('[data-js="showCombobox"]').className = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-is-open";
    }

    hideCombobox(){
        this.template.querySelector('[data-js="showCombobox"]').className = "slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-is-closed";
    }

    handleInputChange(evt) {
        if(evt.target.value === ''){
            this.hideCombobox();
        }else{
            this.displayCombobox();
        }
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
        this.searchProduct = this.template.querySelector('[data-js="searchProduct"]');
        this.searchProduct.value = (evt.target.outerText);
        this.lookUpProduct = this.searchProduct.value;
    }

    @wire(getClient, {recordID:'$recordId'})
        retrievedClient({error,data}){
            if(data){
                this.clientInfo = data;
                this.title = (this.clientInfo.typeClient).toUpperCase()+" "+(this.clientInfo.name).toUpperCase();
            }else if(error){
                console.log(error);
            }
        }
    connectedCallback(){
        
    }

    addItem(){
        // chamar classe e passar todos os dados bonitinhos em JSON incluindo direto no datatable!!!!!
    }
}
