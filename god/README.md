Role: god
=========

Excerpt
-------

- install god
- copy configuration files
- start god deamon


Configuration
-------------

```javascript
{
  "god": {
    "project_name": "My rails app (production)",
    "mailer": {
      "address":  "backup@example.com",
      "server":   "smtp.example.com",
      "port":     587,
      "domain":   "example.com",
      "username": "backup",
      "password": "xxxxxxxx"
    },
    "twilio": {  // [not implemented yet]
      "account":     "",
      "token":       "",
      "number":      "",
      "message_url": ""
    },
    "contacts": [
      {
        // Email
        "name": "webmaster",
        "via":  "email",
        "type": "email",
        "to":   "webmaster@example.com"
      },
      {
        // Twilio [not implemented yet]
        "name": "webmaster",
        "via":  "twilio",
        "type": "number",
        "to":   "0123456789"
      }
    ]
  }
}
```


Todo
----

- Support notification via twilio


Dependencies
------------

- app
- user
- rails

