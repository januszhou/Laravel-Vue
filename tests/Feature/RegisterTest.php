<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class RegisterTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testRegisterSuccess()
    {
        $random = sha1(time());
        $postData = [
            'first_name' => 'foo',
            'last_name' => 'bar',
            'email' => "foo$random@bar.com",
            'password' => 'secret',
            'password_confirmation' => 'secret'
        ];

        $response = $this->post('/api/v1/register', $postData);

        $response->assertStatus(200);
    }

    public function testRegisterFailed()
    {
        $postData = [
            'first_name' => 'foo',
            'last_name' => 'bar',
            'email' => 'foo@bar.com',
            'password' => 'secret',
            'password_confirmation' => null
        ];

        $response = $this->post('/api/v1/register', $postData);

        $response->assertStatus(400);
    }
}
