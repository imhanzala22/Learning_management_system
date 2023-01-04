class StudentParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: [:first_name, :last_name, :Date_of_Birth])
    end
end
