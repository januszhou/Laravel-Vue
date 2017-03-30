<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        static $questionAnswers = [
            'How do you feel' => ['answers' => ['Very Well', 'Well', 'Fair', 'Bad'], 'is_multiple' => 0],
            'What you had for breakfast' => ['answers' => ['Egg', 'Pancake', 'Coffee', 'Bread'], 'is_multiple' => 1],
            'How many days do you work per week' => ['answers' => ['One day', 'Two days', 'Three days', 'Four days', 'Five days', 'More days'], 'is_multiple' => 0]
        ];

        foreach($questionAnswers as $question => $answer){
            $question = factory(App\Models\Question::class)->create(['title' => $question, 'is_multiple' => $answer['is_multiple']]);

            foreach($answer['answers'] as $title){
                $answer = factory(App\Models\Answer::class)->create(['question_id' => $question->id, 'title' => $title]);
            }
        }

        factory(App\Models\User::class, 10)->create()->each(function($u){

        });

        factory(App\Models\User::class, 1)->states('admin')->create();
    }
}
