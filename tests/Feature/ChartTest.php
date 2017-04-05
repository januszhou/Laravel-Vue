<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ChartTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testChart()
    {
        $user = factory(User::class)->create();

        $response = $this->get('/api/v1/charts', ['Authorization' => $user->token]);

        $response->assertStatus(200);
    }
}
