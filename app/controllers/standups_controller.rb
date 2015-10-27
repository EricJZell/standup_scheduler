class StandupsController < ApplicationController
  def index
    @standups = Standup.all
  end

  def new
    @standup = Standup.new
  end

  def create
    employee1 = Employee.where(active: true).first
    employee2 = Employee.where(active: true).limit(1).offset(1).first
    if employee2.nil?
      flash[:warning] = "Not enough active employees to create standup"
      redirect_to employees_path
    else
      standup = Standup.create(standup_params)
      EmployeeStandup.create(employee: employee1, standup: standup)
      EmployeeStandup.create(employee: employee2, standup: standup)
      flash[:success] = "Standup Created"
      redirect_to standups_path
    end
  end

  protected

  def standup_params
    params.require(:standup).permit(:date)
  end
end
