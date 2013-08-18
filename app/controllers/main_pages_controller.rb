class MainPagesController < ApplicationController

  #root page place holder
  def place_holder
    if current_user
      @record = MedicalRecord.find_by_patient(current_user.email)
    end
  end
end
