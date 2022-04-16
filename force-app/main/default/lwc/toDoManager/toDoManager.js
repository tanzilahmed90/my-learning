import { LightningElement,track } from 'lwc';

export default class ToDoManager extends LightningElement {
time='8:12 PM';
greeting='Good Evening';
@track todos=[];

connectedCallback(){
this.getTime();
setInterval(() => {
    this.getTime();
}, 1000*60);
}

getTime(){
    const date =new Date();
    const hour=date.getHours();
    const min=date.getMinutes();
    this.time=`${this.getHour(hour)}:${this.getDoubleDigit(min)} ${this.getMidDay(hour)}`;
    this.getGreeting(hour);
}

getHour(hour){
return hour === 0 ? 12 : hour > 12 ? (hour-12) : hour;
}
getMidDay(hour){
return hour >= 12 ? "PM":"AM";
}
getDoubleDigit(min){
 return min < 10 ? "0"+min : min;
}
getGreeting(hour){
    if(hour < 12)
    this.greeting="Good Morning";
    else if(hour > 12 && hour < 17 )
    this.greeting="Good Afternoon";
    else
    this.greeting="Good Evening";
}
    addToDoHandler(){
        const inputBox=this.template.querySelector("lightning-input");
        console.log('inputBox:', inputBox.value,this.todos.length);
        const todo={
            todoId:this.todos.length,
            todoName:inputBox.value,
            done:false,
            todoDate:new Date( )
        }

        this.todos.push(todo);
        inputBox.value="";
    }
    get upcomingTask(){
        return this.todos && this.todos.length ? this.todos.filter(todo => !todo.done) : [];
    }
    get completedTask(){
        return this.todos && this.todos.length ? this.todos.filter(todo => todo.done) : [];
    }
    handleChange(event){
        
        console.log('event.detail:', event.detail);
        var index = this.todos.findIndex(function(o){
            return o.todoId == event.detail;
       })
       if (index !== -1) this.todos.splice(index, 1);
    }

}