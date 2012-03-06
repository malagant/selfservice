//
//  RegistrationDTO.m
//  SelfService
//
//  Created by Michael Johann on 02.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegistrationDTO.h"

@interface RegistrationDTO ()
- (void)clientDemo;
@end

@implementation RegistrationDTO
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize password = _password;
@synthesize passwordConfirmation = _passwordConfirmation;

+ (void)initMapping:(RKObjectManager *)manager {
    // JSON soll an den Server geschickt werden
    manager.serializationMIMEType = RKMIMETypeJSON;
    // Und beim Empfangen von Daten wollen wir ebenfalls JSON verstehen
    manager.acceptMIMEType = RKMIMETypeJSON;
    // Mapping beschreiben
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RegistrationDTO class]];
    [mapping mapAttributes:@"firstName", @"lastName", @"email", @"password", @"passwordConfirmation", nil];
    // Mapping provider mit unserem neuen Mapping versorgen
    [manager.mappingProvider setMapping:mapping forKeyPath:@"registrationDTO"];
    // Zum Serialisieren von Objekten beschreiben wir das inverse Mapping
    RKObjectMapping *serializationMapping = [mapping inverseMapping];
    serializationMapping.rootKeyPath = @"registrationDTO";
    [manager.mappingProvider setSerializationMapping:serializationMapping forClass:[RegistrationDTO class]];
    // Nun noch die Route zum Server
    [manager.router routeClass:[RegistrationDTO class] toResourcePath:@"/registrations"];
}


- (void)clientDemo {
    // Client instanziieren und base url zuweisen
    RKClient *client = [RKClient clientWithBaseURL:@"http://rails-experts.local:8080/selfservice/api"];
    // Username für den Zugriff (optional)
    client.username = @"motu"; // Master of the universe ;)
    // Passendes Password für den User (optional)
    client.password = @"motu";

    if ([[RKClient sharedClient] isNetworkAvailable]) {
        // Wir wissen nun, dass das Netzwerk verfügbar ist und können eine Aufruf über den Client starten
        // ...
    }
}
@end
