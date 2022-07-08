module UsersHelper
    def roles
        User.roles.keys.map do |role|
            [t("activerecord.attributes.user.roles.#{role}"), role]
        end
    end
end
