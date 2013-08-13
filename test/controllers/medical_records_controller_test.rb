require 'test_helper'

class MedicalRecordsControllerTest < ActionController::TestCase
  setup do
    @medical_record = medical_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_record" do
    assert_difference('MedicalRecord.count') do
      post :create, medical_record: { content: @medical_record.content, creator: @medical_record.creator, patient: @medical_record.patient, reviewer: @medical_record.reviewer, serial_number: @medical_record.serial_number }
    end

    assert_redirected_to medical_record_path(assigns(:medical_record))
  end

  test "should show medical_record" do
    get :show, id: @medical_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_record
    assert_response :success
  end

  test "should update medical_record" do
    patch :update, id: @medical_record, medical_record: { content: @medical_record.content, creator: @medical_record.creator, patient: @medical_record.patient, reviewer: @medical_record.reviewer, serial_number: @medical_record.serial_number }
    assert_redirected_to medical_record_path(assigns(:medical_record))
  end

  test "should destroy medical_record" do
    assert_difference('MedicalRecord.count', -1) do
      delete :destroy, id: @medical_record
    end

    assert_redirected_to medical_records_path
  end
end
