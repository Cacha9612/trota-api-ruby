class ChecklistServices
   def self.create_with_data(params)
    checklist = Checklist.new(params)
    if checklist.save
      checklist
    else
      raise ActiveRecord::RecordInvalid, checklist
    end
  end
end
