
    create table account (
       account_id bigint not null,
        account_type varchar(255),
        close_date datetime,
        created_by varchar(255),
        created_date datetime,
        current_balance decimal(19,2),
        initial_balance decimal(19,2),
        last_updated_by varchar(255),
        last_updated_date datetime,
        name varchar(255),
        open_date datetime,
        primary key (account_id)
    ) engine=InnoDB;

    create table bank (
       bank_id bigint not null,
        user_address_line_1 varchar(255),
        address_line_2 varchar(255),
        city varchar(255),
        state varchar(255),
        zip_code varchar(255),
        created_by varchar(255),
        created_date datetime,
        is_international bit,
        last_updated_by varchar(255),
        last_updated_date datetime,
        name varchar(255),
        primary key (bank_id)
    ) engine=InnoDB;

    create table bank_contact (
       bank_id bigint not null,
        contacts varchar(255)
    ) engine=InnoDB;

    create table bank_contact2 (
       bank_id bigint not null,
        contacts_2 varchar(255),
        position_type varchar(255) not null,
        primary key (bank_id, position_type)
    ) engine=InnoDB;

    create table budget (
       budget_id bigint not null auto_increment,
        goal_amount decimal(19,2),
        name varchar(255),
        period varchar(255),
        primary key (budget_id)
    ) engine=InnoDB;

    create table budget_transaction (
       budget_id bigint not null,
        transaction_id bigint not null
    ) engine=InnoDB;

    create table credential (
       credential_id bigint not null,
        password varchar(255),
        username varchar(255),
        user_id bigint,
        primary key (credential_id)
    ) engine=InnoDB;

    create table currency (
       country_name varchar(255) not null,
        name varchar(255) not null,
        symbol varchar(255),
        primary key (country_name, name)
    ) engine=InnoDB;

    create table finances_user (
       user_id bigint not null,
        birth_date datetime,
        email_address varchar(255),
        person_name varchar(255),
        primary key (user_id)
    ) engine=InnoDB;

    create table hibernate_sequence (
       next_val bigint
    ) engine=InnoDB;

    insert into hibernate_sequence values ( 1 );

    create table ifinaces_keys (
       PK_NAME varchar(255) not null,
        PK_VALUE bigint,
        primary key (PK_NAME)
    ) engine=InnoDB;

    insert into ifinaces_keys(PK_NAME, PK_VALUE) values ('account',0);

    create table joined_defect (
       root_cause varchar(255),
        severity integer,
        id integer not null,
        primary key (id)
    ) engine=InnoDB;

    create table joined_feature (
       level integer,
        id integer not null,
        primary key (id)
    ) engine=InnoDB;

    create table joined_job (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table mapped_super_class_bug (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        root_cause varchar(255),
        severity integer,
        primary key (id)
    ) engine=InnoDB;

    create table mapped_super_class_enhancement (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        duplicate bit,
        priority varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table market (
       market_id bigint not null,
        market_name varchar(255),
        country_name varchar(255),
        currency_name varchar(255),
        primary key (market_id)
    ) engine=InnoDB;

    create table single_table_task (
       dtype varchar(31) not null,
        id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        team varchar(255),
        level integer,
        primary key (id)
    ) engine=InnoDB;

    create table table_per_class_activity (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        root_cause varchar(255),
        severity integer,
        primary key (id)
    ) engine=InnoDB;

    create table table_per_class_item (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table table_per_class_test (
       id integer not null,
        description varchar(255),
        status varchar(255),
        title varchar(255),
        duplicate bit,
        priority varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table transaction (
       transaction_id bigint not null auto_increment,
        amount decimal(19,2),
        closing_balance decimal(19,2),
        created_by varchar(255),
        created_date datetime,
        initial_balance decimal(19,2),
        last_updated_by varchar(255),
        last_updated_date datetime,
        notes varchar(255),
        title varchar(255),
        transaction_type varchar(255),
        account_id bigint,
        primary key (transaction_id)
    ) engine=InnoDB;

    create table user_account (
       account_id bigint not null,
        user_id bigint not null,
        primary key (account_id, user_id)
    ) engine=InnoDB;

    create table user_address (
       user_id bigint not null,
        user_address_line_1 varchar(255),
        address_line_2 varchar(255),
        city varchar(255),
        state varchar(255),
        zip_code varchar(255)
    ) engine=InnoDB;

    alter table budget_transaction 
       add constraint UK_kty5vyy7v0sfhc24vvdjh3qvo unique (transaction_id);

    alter table bank_contact 
       add constraint FKaxnpdk31fp707ousdyu5ilra6 
       foreign key (bank_id) 
       references bank (bank_id);

    alter table bank_contact2 
       add constraint FKhkjbbk5fen965yadvjse4giau 
       foreign key (bank_id) 
       references bank (bank_id);

    alter table budget_transaction 
       add constraint FKemsmc6k4c5ueumaoxac69nto3 
       foreign key (transaction_id) 
       references transaction (transaction_id);

    alter table budget_transaction 
       add constraint FKd29kggwou1k21wratamdv7kky 
       foreign key (budget_id) 
       references budget (budget_id);

    alter table credential 
       add constraint FKlde6756f90cgp6ssa39p6jh3b 
       foreign key (user_id) 
       references finances_user (user_id);

    alter table joined_defect 
       add constraint FK6hsmtrqrh9k4x4kv6moeftx64 
       foreign key (id) 
       references joined_job (id);

    alter table joined_feature 
       add constraint FKcoog0e5sum5mp1gjggwjwlwpa 
       foreign key (id) 
       references joined_job (id);

    alter table market 
       add constraint FKn6x9e782vgm79kagdj0226hwa 
       foreign key (country_name, currency_name) 
       references currency (country_name, name);

    alter table transaction 
       add constraint FK6g20fcr3bhr6bihgy24rq1r1b 
       foreign key (account_id) 
       references account (account_id);

    alter table user_account 
       add constraint FK41ueby8j4pbnlid8w7t59k0bb 
       foreign key (user_id) 
       references finances_user (user_id);

    alter table user_account 
       add constraint FK1pxs5fj6ujqfs13gmfg3o5cwo 
       foreign key (account_id) 
       references account (account_id);

    alter table user_address 
       add constraint FKn5cqa3r4dp2k5l945c3w8iqn7 
       foreign key (user_id) 
       references bank (bank_id);
