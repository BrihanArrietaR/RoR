module OrdersHelper
    def states
        User.states.keys.map do |state|
            [t("activerecord.attributes.order.states.#{state}"), state]
        end
    end
end
