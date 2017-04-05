<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class LoginTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testLogin()
    {
        $user = factory(User::class)->create();

        $response = $this->post('/api/v1/login', ['email' => $user->email, 'password' => 'secret']);

        $response->assertStatus(200);
    }

    public function testLoginFailed()
    {
        $user = factory(User::class)->create();

        $response = $this->post('/api/v1/login', ['email' => $user->email, 'password' => 'secret1']);

        $response->assertStatus(401);
    }
}
