<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class QuestionTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testQuestion()
    {
        $user = factory(User::class)->create();

        $response = $this->get('/api/v1/questions', ['Authorization' => $user->token]);

        $response->assertStatus(200);
    }
}
