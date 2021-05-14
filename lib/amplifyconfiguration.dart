const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:bc9348fa-e6e9-4cba-9188-36f4ff01d2ec",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_KmPnX4Oqj",
                        "AppClientId": "10valaj8ltp45dibj72n4pu4ne",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://h5cgaod7qjdclnakzfhaceh46y.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-c5xtuodsjvgptin3lo7tuiotf4",
                        "ClientDatabasePrefix": "amplifycodelab_API_KEY"
                    },
                    "amplifycodelab_AWS_IAM": {
                        "ApiUrl": "https://h5cgaod7qjdclnakzfhaceh46y.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "amplifycodelab_AWS_IAM"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "amplifycodelab": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://h5cgaod7qjdclnakzfhaceh46y.appsync-api.us-west-2.amazonaws.com/graphql",
                    "region": "us-west-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-c5xtuodsjvgptin3lo7tuiotf4"
                },
            }
        }
    }
}''';
