class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = 'Employee Successfully Added'
      redirect_to employees_path
    else
      flash[:warning] = @employee.errors.full_messages.join(', ')
      render :new
    end
  end

  protected

  def employee_params
    params.require(:employee).permit(:name)
  end
end
