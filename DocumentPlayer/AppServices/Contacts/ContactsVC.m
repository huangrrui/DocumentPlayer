//
//  ContactsVC.m
//  DocumentPlayer
//
//  Created by 黄瑞 on 2019/7/17.
//  Copyright © 2019 黄瑞. All rights reserved.
//

#import "ContactsVC.h"
#import <Contacts/Contacts.h>

@interface ContactsVC ()

@end

@implementation ContactsVC

#pragma mark - View did load
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSError *error;
    BOOL result;
    
    CNContactStore *store = [[CNContactStore alloc] init];
    
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"granted = %@, error = %@", granted ? @"YES" : @"NO", error);
    }];
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    switch (status)
    {
        case CNAuthorizationStatusDenied:
            NSLog(@"status = CNAuthorizationStatusDenied");
            break;
        case CNAuthorizationStatusAuthorized:
            NSLog(@"status = CNAuthorizationStatusAuthorized");
            break;
        case CNAuthorizationStatusRestricted:
            NSLog(@"status = CNAuthorizationStatusRestricted");
            break;
        case CNAuthorizationStatusNotDetermined:
            NSLog(@"status = CNAuthorizationStatusNotDetermined");
            break;
    }
    
    NSMutableArray <NSString *> *identifierList = [NSMutableArray array];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[]];
    result = [store enumerateContactsWithFetchRequest:fetchRequest error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [identifierList addObject:contact.identifier];
    }];
    NSLog(@"enumerateContactsWithFetchRequest:error:usingBlock: = %@", result ? @"success" : @"failure");
    NSLog(@"identifier list = %@", identifierList);
    
    NSString *identifier = identifierList.lastObject;
    NSArray *keysToFetch = @[
                             CNContactNamePrefixKey,
                             CNContactNamePrefixKey,
                             CNContactGivenNameKey,
                             CNContactMiddleNameKey,
                             CNContactFamilyNameKey,
                             CNContactPreviousFamilyNameKey,
                             CNContactNameSuffixKey,
                             CNContactNicknameKey,
                             CNContactOrganizationNameKey,
                             CNContactDepartmentNameKey,
                             CNContactJobTitleKey,
                             CNContactPhoneticGivenNameKey,
                             CNContactPhoneticMiddleNameKey,
                             CNContactPhoneticFamilyNameKey,
                             CNContactPhoneticOrganizationNameKey,
                             CNContactBirthdayKey,
                             CNContactNonGregorianBirthdayKey,
                             CNContactNoteKey,
                             CNContactImageDataKey,
                             CNContactThumbnailImageDataKey,
                             CNContactImageDataAvailableKey,
                             CNContactTypeKey,
                             CNContactPhoneNumbersKey,
                             CNContactEmailAddressesKey,
                             CNContactPostalAddressesKey,
                             CNContactDatesKey,
                             CNContactUrlAddressesKey,
                             CNContactRelationsKey,
                             CNContactSocialProfilesKey,
                             CNContactInstantMessageAddressesKey,
    ];
    CNContact *contact = [store unifiedContactWithIdentifier:identifier keysToFetch:keysToFetch error:&error];
    if (error)
    {
        NSLog(@"unifiedContactWithIdentifier:keysToFetch:error: failure %@", error);
    }
    else
    {
        NSLog(@"unifiedContactWithIdentifier:keysToFetch:error: success");
        NSLog(@"identifier = %@", contact.identifier);
        NSLog(@"contactType = %@", ({
            NSString *str;
            switch (contact.contactType)
            {
                case CNContactTypePerson:
                    str = @"CNContactTypePerson";
                    break;
                case CNContactTypeOrganization:
                    str = @"CNContactTypeOrganization";
                    break;
            }
            str;
        }));
        NSMutableDictionary *personInfo = [NSMutableDictionary dictionary];
        NSLog(@"namePrefix = %@", contact.namePrefix);
        NSLog(@"givenName = %@", contact.givenName);
        NSLog(@"middleName = %@", contact.middleName);
        NSLog(@"familyName = %@", contact.familyName);
        NSLog(@"previousFamilyName = %@", contact.previousFamilyName);
        NSLog(@"nameSuffix = %@", contact.nameSuffix);
        NSLog(@"nickname = %@", contact.nickname);
        NSLog(@"organizationName = %@", contact.organizationName);
        NSLog(@"departmentName = %@", contact.departmentName);
        NSLog(@"jobTitle = %@", contact.jobTitle);
        NSLog(@"phoneticGivenName = %@", contact.phoneticGivenName);
        NSLog(@"phoneticMiddleName = %@", contact.phoneticMiddleName);
        NSLog(@"phoneticFamilyName = %@", contact.phoneticFamilyName);
        NSLog(@"phoneticOrganizationName = %@", contact.phoneticOrganizationName);
        NSLog(@"note = %@", contact.note);
        NSLog(@"imageData = %@", contact.imageData);
        NSLog(@"thumbnailImageData = %@", contact.thumbnailImageData);
        NSLog(@"imageDataAvailable = %@", contact.imageDataAvailable ? @"true" : @"false");
        NSLog(@"phoneNumbers = %@", contact.phoneNumbers);
        NSLog(@"emailAddresses = %@", contact.emailAddresses);
        NSLog(@"postalAddresses = %@", contact.postalAddresses);
        NSLog(@"urlAddresses = %@", contact.urlAddresses);
        NSLog(@"contactRelations = %@", contact.contactRelations);
        NSLog(@"socialProfiles = %@", contact.socialProfiles);
        NSLog(@"instantMessageAddresses = %@", contact.instantMessageAddresses);
        NSLog(@"birthday = %@", contact.birthday);
        NSLog(@"nonGregorianBirthday = %@", contact.nonGregorianBirthday);
        NSLog(@"dates = %@", contact.dates);
        NSLog(@"identifier = %@", contact.identifier);
        NSLog(@"identifier = %@", contact.identifier);
        NSLog(@"identifier = %@", contact.identifier);

    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"familyName == Haro"];
    keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey];
    NSArray <CNContact *> *contactList = [store unifiedContactsMatchingPredicate:predicate keysToFetch:keysToFetch error:&error];
    if (error)
    {
        NSLog(@"unifiedContactsMatchingPredicate:keysToFetch:error: failure %@", error);
    }
    else
    {
        NSLog(@"unifiedContactsMatchingPredicate:keysToFetch:error: success");
        NSLog(@"%@", contactList);
    }
    
    NSMutableArray <NSDictionary *> *phoneNumberList = [NSMutableArray array];
    for (NSString *identifier in identifierList)
    {
        NSArray *keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
        CNContact *contact = [store unifiedContactWithIdentifier:identifier keysToFetch:keysToFetch error:&error];
        for (CNLabeledValue <CNPhoneNumber *> *value in contact.phoneNumbers)
        {
            [phoneNumberList addObject:@{
                                         @"mName":[NSString stringWithFormat:@"%@%@", contact.familyName, contact.givenName],
                                         @"mobile":value.value.stringValue,
                                         }];
        }
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:phoneNumberList options:NSJSONWritingSortedKeys error:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    else
    {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString = %@", jsonString);
    }
}

#pragma mark - NSNotification method
#pragma mark - Gesture method
#pragma mark - IB action
#pragma mark - Delegate
#pragma mark - Data source
#pragma mark - Other
#pragma mark - UI config
#pragma mark - UI update
#pragma mark - Network
#pragma mark - Get
#pragma mark - Set

@end
