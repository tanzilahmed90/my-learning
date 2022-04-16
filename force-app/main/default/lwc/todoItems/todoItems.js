import { LightningElement ,api} from 'lwc';

export default class TodoItems extends LightningElement {
    @api todoId;
    @api todoName;
    @api done=false;
    renderedCallback(){
        console.log("todoId ",this.todoId);
    }
get containerClass(){
    return this.done ? "todo completed" : "todo upcoming";
}

deleteHandler(event){
    
   
     const myDemoEvent = new CustomEvent('demoevent',{
         detail:this.todoId
        });
     this.dispatchEvent(myDemoEvent);
     //window.console.log('nameInpBBB' + this.nameInp);
   }

}