function fn() {
karate.configure('retry',{count: 3,interval:10000})
  var env = karate.env; // get system property 'karate.env'
  karate.log('Environment system property was:', env);
  if (!env) {
    env = 'UAT';
  }
  var config = {
    env: env,
BaseUrl: 'https://api.uatwamly.co.za/wamly/integrations/v1/partner-api/'
  }
  if (env == 'INT') {
   config.BaseUrl= 'https://api.intwamly.co.za/wamly/v1'
  } else if (env == 'UAT') {
//   config.BaseUrl= 'https://ui.uatwamly.co.za//wamly/v1'

  }
  return config;
}