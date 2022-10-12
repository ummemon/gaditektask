<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMailboxTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mailbox', function (Blueprint $table) {
            $table->id();
            $table->string('subject')->nullable();
            $table->longtext('message')->nullable();
            $table->integer("sender_id")->unsigned();
            $table->integer("sender_to_id")->unsigned();
            $table->integer("parent_id")->default(0);
            $table->integer("is_read")->default(0);
            $table->enum('status', ['Sent', 'received']);
            $table->timestamps();
            //$table->foreign('sender_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mailbox');
    }
}
