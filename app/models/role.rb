class Role < ActiveRecord::Base
  #define relationship with users
  has_and_belongs_to_many :users

  validates :name,
    :inclusion => { :in => ['Admin', 'Doctor', 'Technician', 'Patient'],
                    :message => "invalid user type" }

  def to_s
    self.name
  end
end
