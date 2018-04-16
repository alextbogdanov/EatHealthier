class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    has_many :meals, dependent: :destroy
    has_one :goal, dependent: :destroy
    has_one :recommended_recipe, dependent: :destroy

    def calc_recommended_nutrients_per_day
        @user = self

        # Calc recommended calories per day
        if @user.sex == "Male"
            @recommended_calories_per_day = 66 + (13.7 * @user.weight) + (5 * @user.height) - (6.8 * @user.age).round(1)

        elsif @user.sex == "Female"
            @recommended_calories_per_day = 655 + (9.6 * @user.weight) + (1.8 * @user.height) - (4.7 * @user.age).round(1)
        end

        # Calc recommended proteins, carbohydrates per day
        if @user.age <= 20
            @recommended_proteins_per_day = (0.7 - (1 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_carbohydrates_per_day = (2.2 - (3.2 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_fat_per_day = (0.25 - (0.4 * @user.weight * 1000 / 453.592)).abs.round(1)

        elsif @user.age >= 21 && @user.age <= 40
            @recommended_proteins_per_day = (0.9 - (1.2 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_carbohydrates_per_day = (1.7 - (2.7 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_fat_per_day = (0.35 - (0.5 * @user.weight * 1000 / 453.592)).abs.round(1)

        elsif @user.age >= 41 && @user.age <= 65
            @recommended_proteins_per_day = (1.1 - (1.4 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_carbohydrates_per_day = (1.2 - (2.2 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_fat_per_day = (0.45 - (0.6 * @user.weight * 1000 / 453.592)).abs.round(1)

        elsif @user.age > 65
            @recommended_proteins_per_day = (1.3 - (1.5 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_carbohydrates_per_day = (0.7 - (1.7 * @user.weight * 1000 / 453.592)).abs.round(1)

            @recommended_fat_per_day = (0.55 - (0.7 * @user.weight * 1000 / 453.592)).abs.round(1)
        end

        @user.update(recommended_calories_per_day: @recommended_calories_per_day, recommended_proteins_per_day: @recommended_proteins_per_day, recommended_carbohydrates_per_day: @recommended_carbohydrates_per_day, recommended_fat_per_day: @recommended_fat_per_day)

        return @recommended_carbohydrates_per_day
    end

    def calc_total_nutrition
        return self.total_carbohydrates + self.total_proteins + self.total_fat
    end
end