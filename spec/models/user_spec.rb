require 'rails_helper'

RSpec.describe User, type: :model do
    let!(:user) {User.new}
    context "validations" do
        it "cannot have a blank email" do
            user.first_name = "Han"
            user.last_name = "Solo"
            user.birthday = "11/02/1991"
            user.password = "P@ssw0rd"
            user.mobile = "09234567890"
            user.created_at = DateTime.now
            user.updated_at = DateTime.now

            
            expect(user).to_not be_valid
            expect(user.errors).to be_present
            expect(user.errors.to_hash.keys).to include(:email)
            expect(user.errors[:email]).to include("can't be blank")
        end

        it "cannot have a blank password" do
            user.first_name = "Han"
            user.last_name = "Solo"
            user.birthday = "11/02/1991"
            user.email = "test@example.com"
            user.mobile = "09234567890"
            user.created_at = DateTime.now
            user.updated_at = DateTime.now

            
            expect(user).to_not be_valid
            expect(user.errors).to be_present
            expect(user.errors.to_hash.keys).to include(:password)
            expect(user.errors[:password]).to include("can't be blank")
        end

        it "cannot have a blank first name and last name" do
            user.birthday = "11/02/1991"
            user.password = "P@ssw0rd"
            user.mobile = "09234567890"
            user.created_at = DateTime.now
            user.updated_at = DateTime.now

            
            expect(user).to_not be_valid
            expect(user.errors).to be_present
            expect(user.errors.to_hash.keys).to include(:first_name, :last_name)
            expect(user.errors[:first_name]).to include("can't be blank")
            expect(user.errors[:last_name]).to include("can't be blank")
        end

        it "cannot have a blank birthday" do
            user.first_name = "Han"
            user.last_name = "Solo"
            user.email = "test@example.com"
            user.password = "P@ssw0rd"
            user.mobile = "09234567890"
            user.created_at = DateTime.now
            user.updated_at = DateTime.now

            
            expect(user).to_not be_valid
            expect(user.errors).to be_present
            expect(user.errors.to_hash.keys).to include(:birthday)
            expect(user.errors[:birthday]).to include("can't be blank")
        end

        it "is not a unique email address" do
            first = User.create( first_name: "Han", 
                                last_name: "Solo",
                                email: "test@example.com",
                                password: "P@ssw0rd",
                                birthday: "11/02/1991",
                                mobile: "09234567890",
                                created_at: DateTime.now,
                                updated_at: DateTime.now )
            second = User.create( first_name: "Hany", 
                                    last_name: "Soloz",
                                    email: "test@example.com",
                                    password: "P@ssw0rd",
                                    birthday: "11/02/1991",
                                    mobile: "09234567891",
                                    created_at: DateTime.now,
                                    updated_at: DateTime.now )

            expect(second).to_not be_valid
            expect(second.errors.to_hash.keys).to include(:email)
            expect(second.errors[:email]).to include("has already been taken")
        end

        it "should have at least 8 min characters, one lowercase letter, one uppercase letter, one digit, and one special character for the password" do
            user.first_name = "Han"
            user.last_name = "Solo"
            user.email = "test@example.com"
            user.password = "P@ssw0rd"
            user.birthday = "11/02/1991"
            user.mobile = "09234567890"
            user.created_at = DateTime.now
            user.updated_at = DateTime.now

            
            expect(user).to be_valid
            expect(user.errors).to_not be_present
            expect(user.password).to match(/(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/)  
        end
    end

    context "default values" do
        it "should have a default role of trader" do
            han = User.create( first_name: "Han", 
                                last_name: "Solo",
                                email: "test@example.com",
                                password: "P@ssw0rd",
                                birthday: "11/02/1991",
                                mobile: "09234567890",
                                created_at: DateTime.now,
                                updated_at: DateTime.now )

            expect(han).to be_valid
            expect(han.errors).to_not be_present
            expect(han.roles).to include(:trader)
        end

        it "should have a default value of not approved" do
            han = User.create( first_name: "Han", 
                                last_name: "Solo",
                                email: "test@example.com",
                                password: "P@ssw0rd",
                                birthday: "11/02/1991",
                                mobile: "09234567890",
                                created_at: DateTime.now,
                                updated_at: DateTime.now )

            expect(han).to be_valid
            expect(han.errors).to_not be_present
            expect(han.is_approved).to be === false
        end
    end
end