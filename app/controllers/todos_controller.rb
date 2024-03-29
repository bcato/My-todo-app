class TodosController < ApplicationController
  def index
  	@todo_items = Todo.all
  	@new_todo = Todo.new
  	render :index
  end

  def delete
  	#Todo.find(params[:id]).destroy
    #redirect_to :action => 'index'
  end

  def add
  	todo = Todo.create(:todo_item => params[:todo][:todo_item])
  	unless todo.valid?
  		flash[:error] = todo.errors.full_message.join("<br>").html_safe
  	else
  		#set flash[:success] to "Todo added successfully"	
  	end
  	redirect_to :action => 'index'
  end

  def complete
  	params[:todos_checkbox].each do |check|
  		todo_id = check
  		t = Todo.find_by_id(todo_id)
  		t.update_attribute(:completed, true)
  	end
  	redirect_to :action => "index"
  end

end
