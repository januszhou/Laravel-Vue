<template>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Login</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="" v-on:submit.prevent="onSubmit">

                        <div v-if="error" class="form-group has-error">
                            <span class="help-block text-center">
                                <strong>{{error}}</strong>
                            </span>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-4 control-label">Email</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="" required autofocus v-model="email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required v-model="password">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                email: null,
                password: null,
                error: null
            }
        },
        methods:{
            onSubmit(event){
                axios.post('/api/v1/login', {
                    email: this.email,
                    password: this.password
                })
                .then((response) => {
                    console.log(response);
                    this.$store.commit('setUser', response.data);
                    axios.defaults.headers.common['Authorization'] = response.data.token;
                    this.$cookie.set('authorization', JSON.stringify({token: response.data.token, url: response.data.href}) , { expires: '1M' });
                    this.$router.push({ path: '/' });
                })
                .catch((error) => {
                    console.log(error.response.data);
                    this.error = error.response.data.detail;
                    setTimeout(() => {
                        this.error = null;
                    }, 2000);
                });
            }
        }
    }
</script>
