from jsonschema import validate

def user_post_validate(data):
    schema = {
        "type": "object",
        "properties": {
            "user": {
                "type": "object",
                "properties": {
                    "email": {"type": "string"},
                    "password": {"type": "string"}
                }
            },
            "university_studying_at": {"type": "number"},
            "first_name": {"type": "string"},
            "last_name": {"type": "string"},
            "field_of_study": {"type": "string"},
        }
    }
    print(data)
    validate(instance=data, schema=schema)