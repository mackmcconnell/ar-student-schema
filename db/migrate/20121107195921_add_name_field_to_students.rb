require_relative '../config'

class AddNameFieldToStudents < ActiveRecord::Migration

  def up
    add_column :students, :name,    :string
    add_column :students, :address, :string
    Student.all.each do |student|
      student.update_column :name, "#{student.first_name} #{student.last_name}"
    end
    remove_column(:students, :first_name)
    remove_column(:students, :last_name)
  end

  def down
    remove_column :students, :name
  end

end