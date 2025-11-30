--
-- PostgreSQL database dump
--

\restrict U8OCE13mw8nd8efoCWTt69enWX2774uxM7m7LiGh5wHBzkV9vpchkmnx3Zv3wA6

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    bank_id integer NOT NULL,
    bank_code character varying(10) NOT NULL,
    bank_name character varying(255) NOT NULL,
    app_name character varying(255)
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: banks_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banks_bank_id_seq OWNER TO postgres;

--
-- Name: banks_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_bank_id_seq OWNED BY public.banks.bank_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    bank_id integer NOT NULL,
    review_text text NOT NULL,
    rating double precision,
    review_date date,
    sentiment_label character varying(50),
    sentiment_score double precision,
    source character varying(100)
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: banks bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN bank_id SET DEFAULT nextval('public.banks_bank_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (bank_id, bank_code, bank_name, app_name) FROM stdin;
1	BOA	Bank of Abyssinia	\N
2	CBE	Commercial Bank of Ethiopia	\N
3	Dashen	Dashen Bank	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, bank_id, review_text, rating, review_date, sentiment_label, sentiment_score, source) FROM stdin;
1	1	bad exprience...it is so crushed	1	2025-11-27	negative	-0.7973	Google Play
2	1	not user friendly at all it requires a huge connectivity and also lags many times	1	2025-11-26	negative	-0.4268	Google Play
3	1	most of the time is not working properly	1	2025-11-25	neutral	0	Google Play
4	1	It keeps notifying me to disable developer options and quiet while I'm not enabled. always bring another type of problem with new updates.	1	2025-11-22	negative	-0.4019	Google Play
5	1	the lag is unbelievable when you need it the most this suks	1	2025-11-19	negative	-0.1531	Google Play
6	1	I cant belive I could find the worst bank app ever .yet very simple to fix the problem and the company just ignored it. no body can do business with this kind of app.	1	2025-11-18	negative	-0.8834	Google Play
7	1	it is not working at all	1	2025-11-15	neutral	0	Google Play
8	1	app is good but i was live in abroad and when i enter my otp code it didnt make me to write my code it the app want it self write thats not fair so please other wise i like it why	5	2025-11-15	positive	0.9142	Google Play
9	1	when trying to activate the app it keeps on loading on the security questions page. It has been two days	1	2025-11-13	positive	0.34	Google Play
10	1	I would like to share feedback regarding the application. It frequently experiences disruptions and does not function properly, often freezing or failing to load. This issue is affecting workflow and efficiency. Kindly review and address this problem to ensure smoother performance.	1	2025-11-08	positive	0.4166	Google Play
11	1	Meet you genuine.App I tried is not functional.Helping.welldoingwith BOA Ethiopia .fastandrelevant.morconnecting Digitalyworld.Digitalyworld. thanks.	5	2025-11-08	positive	0.4404	Google Play
12	1	Barely works, it always fails to connect	1	2025-11-07	negative	-0.4215	Google Play
13	1	this app launch time is so long also has dozen bugs in addition it's has been long time get update	1	2025-11-05	neutral	0	Google Play
14	1	Your application is very irritating to use, some functionality doesn't even work like on the card management. You need to do better than this and it good idea to reference other banking applications.	3	2025-11-04	positive	0.102	Google Play
15	1	i m sorry but it doesn't work for my android it is too slow but other bank are very fast please update	1	2025-10-30	positive	0.4969	Google Play
16	1	I kindly request that Bank of abyssinia address issues with its mobile app. It is very slow, has numerous problems, and frequently experiences downtime. The user experience is also poor. Thank you.	1	2025-10-28	neutral	-0.0258	Google Play
17	1	this app can't open? what is problem? please solve my problem?	1	2025-10-28	negative	-0.4291	Google Play
18	1	the worst app in my financial experience.	1	2025-10-22	negative	-0.6249	Google Play
19	1	good for mb appliciation	5	2025-10-21	positive	0.4404	Google Play
20	1	the worst bank ever. slow don't accept dual sim. they are very stupid and greedy	1	2025-10-20	negative	-0.9107	Google Play
21	1	The app is not suitable and lacks a good UI design. As a large bank, you must update your app with a professional UI that is fast and appropriate.	2	2025-10-16	positive	0.4404	Google Play
22	1	an exceptional banking app.	5	2025-10-16	neutral	0	Google Play
23	1	from the last week updates the app is not working Please check the problems	1	2025-10-08	negative	-0.5664	Google Play
24	1	office branches have to improve their services please	4	2025-10-07	positive	0.6369	Google Play
25	1	Why does it keep crashing? I can't even use this. BOA should do better. You have many customers and how to deal with this. I can't send money now.	1	2025-10-05	positive	0.4404	Google Play
26	1	it needs a timely update	5	2025-10-03	neutral	0	Google Play
27	1	It does not show the name of the person who sent the money to request a receipt. This has become very difficult for us. When different people transfer the same amount to me from different banks, it is very difficult to identify the account or the name of the sender.	3	2025-10-01	negative	-0.6794	Google Play
28	1	I can't type my otp on it.	1	2025-10-01	neutral	0	Google Play
29	1	most of bank apps in Ethiopia are linked with ethiopian phone number, I live in US permanently so when I open BoA account, I told them where I live and to link it with email address instead of phone # as ethio phone number is not working where I live, unfortunetly my fear appeared and now when I change my phone device, it send the code to the ethio number which is not with me now. so please when u develop bank apps consider the diaspora community to use ur apps	1	2025-10-01	positive	0.1757	Google Play
30	1	I love this bank the best experience ever.	5	2025-09-28	positive	0.8555	Google Play
31	1	Nothing has been improved, it doesn't work like the previous version.	1	2025-09-25	negative	-0.5667	Google Play
32	1	need alot of connection, chooses device, very lug even when there is connection	1	2025-09-17	neutral	0	Google Play
33	1	On my ios it's perfect but on android it barley works and don't transfer and after a while it crushed and totally stopped working. Please fix the issue my beloved bank of abyssinia.	1	2025-09-15	positive	0.5656	Google Play
34	1	since the last update i can open the app crashes a lot and omg its being very slow opening and loading	2	2025-09-15	neutral	0	Google Play
35	1	very good app i ever used	5	2025-09-12	positive	0.4927	Google Play
36	1	its nice app especially the transaction limit is extended but We face that BoA m.banking app doesn't respond at the activation stage strictly at SMSNG mobile phone. please try this to make safe.	4	2025-09-11	positive	0.8271	Google Play
37	1	please open my mobile app	5	2025-09-10	positive	0.3182	Google Play
38	1	Best banking transaction application in Ethiopia !	5	2025-09-05	positive	0.6696	Google Play
39	1	has issue after installation and i think it doesn't work with tecno common 30	1	2025-08-26	neutral	0	Google Play
40	1	One of the best in this business	5	2025-08-25	positive	0.6369	Google Play
83	1	the app gets a considerable improvements like language , QR scanner and unlimited transfers survice. but BOA Please do alot on its fastness and convenient when we login and making a transactions.	5	2025-04-04	positive	0.6542	Google Play
41	1	as bank, u should at least hire someone good at their job bc this a joke nowadays I can't even log in or even transfer without it crashing if u fix the app I will update this review I am counting on u boa update: so they atleast fixed it but as suggestion can u put password when in final step of sending money it will feel more secure that way	4	2025-08-17	positive	0.7383	Google Play
42	1	very nice mobile banking app my favourite	5	2025-08-16	positive	0.4754	Google Play
43	1	it almost never boots up!!! and even if it did, it crashes immediately	1	2025-08-15	neutral	0	Google Play
44	1	the worst app ever to exist in a bank history	1	2025-08-15	negative	-0.6249	Google Play
45	1	Best mobile app in the country	5	2025-08-14	positive	0.6369	Google Play
46	1	keeps freezing at the front page.	1	2025-08-10	negative	-0.1027	Google Play
47	1	it is not working on redminote 11 pro+ pls fix it	1	2025-08-08	positive	0.0772	Google Play
48	1	1) Crashes repeatedly 2) Takes Century to Boot 3) Repeatedly requires Update which is very annoying. 4) It doesn't ask for Password for one step confirmation when transferring money. 5) Automatically stops music when the app is launched (it doesn't really matter just fyi) Overall this have to be the worst mobile banking app I have tried so far and should not be released with all these bugs & issues.	1	2025-08-02	negative	-0.8168	Google Play
49	1	The Worst Mobile Banking App.	1	2025-07-31	negative	-0.6249	Google Play
50	1	best bank in ethiopia	5	2025-07-29	positive	0.6369	Google Play
51	1	please is not working	2	2025-07-27	positive	0.3182	Google Play
52	1	nothing when I need to install the Apk it say that re-up date	5	2025-07-25	neutral	0	Google Play
53	1	I can log in from any where	5	2025-07-23	neutral	0	Google Play
54	1	This App is Getting worse and worse with every update	2	2025-07-11	negative	-0.7351	Google Play
55	1	awasome app go a head	5	2025-07-04	neutral	0	Google Play
56	1	it sucks as hell. it crashes most of the time and takes a long time to load .	1	2025-07-03	negative	-0.7964	Google Play
57	1	The App is nice and easy to use but after some time it crushed and said "Error check your device connectivity" please fix it	3	2025-07-02	negative	-0.3506	Google Play
58	1	Easy and very nice app to load more than the previouse but in recent time some loading problem detected.	5	2025-07-01	negative	-0.1415	Google Play
59	1	The worst MBA I have experienced, The app crush frequently and they take to long to fix the problem even more than a week.	1	2025-06-27	negative	-0.8126	Google Play
60	1	very uninterested it's not working when the "developer mode on" i haven't off the developer options i preferred to uninstall your app .....	1	2025-06-24	neutral	0	Google Play
61	1	its very bad app its very slow	1	2025-06-17	negative	-0.5849	Google Play
62	1	the worst app humans ever created	1	2025-06-09	negative	-0.4767	Google Play
63	1	Hello, Im facing a problem with the BOA Mobile app. Every time I enter my phone number and password, the app crashes and shows an error that says BoaMobile closed because this app has a bug. I tried updating, reinstalling, and clearing cache, but nothing worked. Please fix this bug in the next update. I really need access to my account. Thank you.	1	2025-06-03	negative	-0.1884	Google Play
64	1	this is worest app 24/7 loading	1	2025-06-01	neutral	0	Google Play
65	1	BoA system is confartable	5	2025-06-01	neutral	0	Google Play
66	1	this app, for me , is a waste of time. It doesn't work . I can't even long in, and it really piss me off. FIX THE PROBLEM	1	2025-05-27	negative	-0.8491	Google Play
67	1	the app crush frequently	1	2025-05-24	negative	-0.1531	Google Play
68	1	This app is a joke. It crashes more than it works, takes forever to load, and half the features are just decorative at this point. Cant log in, cant transfer money, cant even check my balance without it bugging out. To the developer: Are you actually trying to make this work, or is this some kind of social experiment to test our patience? Did you build this in your sleep? Because it definitely looks like it. If this is your idea of a functional app, maybe consider a different career path	1	2025-05-21	positive	0.7757	Google Play
69	1	but not opening on android	4	2025-05-19	neutral	0	Google Play
70	1	Worst App ever. Totally unreliable. And it didn't work at all for the last 4 months.	1	2025-05-18	negative	-0.6249	Google Play
71	1	this app does no work on Samsung a51, it just gives a preview of the logo	1	2025-05-11	negative	-0.296	Google Play
72	1	i entered incorrect security question by mistake boa app lock pin forever, why is there no other options? ?? i contacted different branchs more then 4times but they didn't able to solve this issue .	5	2025-05-10	negative	-0.4639	Google Play
73	1	liking this application good	5	2025-05-07	positive	0.6808	Google Play
74	1	This app future is good, but there is problems with apps to reset and activate it, which is difficult even to the branch staffs, and it takes too long times to active at the branch plus most of the time high expected failure of activation after process at the counter and OTP sent not work	1	2025-05-06	negative	-0.775	Google Play
75	1	Bad app . it stuck when you open and noting WORKS.	1	2025-04-23	negative	-0.6705	Google Play
76	1	the app isn't working after it asked me the password it starts loading, but it doesn't open	3	2025-04-20	neutral	0	Google Play
77	1	It keeps showing this pop up to turn off developer options even tho it's off! I had to turn on and then off to make it work! This is a horrible experience and needs a fix asap! Plus kinda slow.	1	2025-04-19	negative	-0.6571	Google Play
78	1	boa of mobile backing	5	2025-04-09	neutral	0.0258	Google Play
79	1	faster bank of Abissinya	5	2025-04-08	neutral	0	Google Play
80	1	i would have given it a lower if it was possible because it crush so much and it take the bank so long to fix the bug	1	2025-04-08	negative	-0.4215	Google Play
81	1	it just doesn't work...so frustrating	1	2025-04-07	positive	0.3412	Google Play
82	1	it's not work correctly... you must have update it	1	2025-04-06	neutral	0	Google Play
84	1	after i typed in my password it says successfully logged out ...and goes back to the first page	2	2025-04-04	positive	0.4939	Google Play
85	1	good but they don't update enough don't add new things	3	2025-04-04	positive	0.2382	Google Play
86	1	it doesn't work period z slowest mobile banking ever i would rather use *815#	1	2025-04-01	neutral	0	Google Play
87	1	after activated the application it not allowed to sign , automatically it is turn off In my phone, why ?	1	2025-03-31	neutral	0	Google Play
88	1	this version is not working for me I cannot even buy card. I cannot send money	1	2025-03-30	neutral	0	Google Play
89	1	It can't actively on initialization, it says incorrect OTP getting the exact OTP	1	2025-03-29	negative	-0.2411	Google Play
90	1	always problematic hardly works	1	2025-03-26	negative	-0.4404	Google Play
91	1	considering the fact the bank is huge this app really bad you could do better	1	2025-03-25	positive	0.1045	Google Play
92	1	worst app and Bank ever u be ashamed, scammer	1	2025-03-24	negative	-0.802	Google Play
93	1	i have went to the bank so many times because i couldn't make any transaction i can only see my balance nothing else so what is the point of having mobile banking if i can't make any transaction with it please work in that	1	2025-03-21	positive	0.3182	Google Play
94	1	For anyone who wants to download it, just don't!!!	1	2025-03-19	neutral	0	Google Play
95	1	Edit: New bug, app not letting me type in my otp codes. Shameful Why does this app not allow me to use it while having developer options on? Did y'all consider that I might, perhaps, be an actual developer? Why am I expected to toggle the option on and off just to bank (restarting my phone when I do)? Why is the message labled as somthing that will "smoothen" the experience? This is like the most "security consultant" thing to implement in an app. Please invest in actual security, not this mess.	1	2025-03-12	positive	0.8121	Google Play
96	1	Improved to be the best	5	2025-03-11	positive	0.8074	Google Play
97	1	Decent, but there problems sometimes it says error When i transfer money but infact it transferred because of this bug i transferred 2 times instead of 1 and also we can't transfer money to others telebirr acc we only can to our self BOE Dev fix this !!!	3	2025-03-11	negative	-0.8392	Google Play
98	1	BoA Greqt Ethiopian bank.	5	2025-03-11	neutral	0	Google Play
99	1	The bug is still there,the app crashes every time i try to log in, especially in old phones like my Galaxy A32	1	2025-03-10	positive	0.3612	Google Play
100	1	Almost better compared to cbe where it is not qualified for	4	2025-03-09	positive	0.3832	Google Play
101	1	what awesome apps. it is very simple to use and more much important apps.	5	2025-03-09	positive	0.7334	Google Play
102	1	i can't use this app why?	5	2025-03-07	neutral	0	Google Play
103	1	Worst mobile banking app I ever experienced I was blaming other apps but comparing with this they're too much better!!!! It clashes it takes much longer time to login while loading in short it's a complete of trash	1	2025-03-06	negative	-0.702	Google Play
104	1	bro the worst app made by human kind!! as a software engineer it make me so sad seeing enterprise as big as BOA make apps like this. it is a disgrace for our country!!	1	2025-03-05	negative	-0.8205	Google Play
105	1	AGA B Girja Miss language of admin Afaan oromo & other Itoophiyaa languages	1	2025-03-04	negative	-0.1531	Google Play
106	1	I downloaded the app for the first time while reading other customers reviews and as soon as i installed and opened the app it closes back automatically, what unserious bank, now i uninstalled the app immediately	1	2025-03-03	neutral	0	Google Play
107	1	It has good features but sometimes it doesn't work...0	1	2025-03-02	positive	0.2382	Google Play
108	1	Very poor proformance	1	2025-03-01	negative	-0.5256	Google Play
109	1	It's not opening. Really frustrating	1	2025-03-01	positive	0.3865	Google Play
110	1	Verry Amazing App from all IB	5	2025-03-01	positive	0.5859	Google Play
111	1	Not working on this days	1	2025-02-26	neutral	0	Google Play
112	1	best banking app in the wworld	5	2025-02-22	positive	0.6369	Google Play
113	1	Nice app and it's easy to use	5	2025-02-21	positive	0.6908	Google Play
114	1	please add language in the apps setting(amharic afan oromo, tigniya,and others) sometimes bank to bank transfer is not available through time and even if if it is available not reachableit is serious issue!	1	2025-02-15	positive	0.4242	Google Play
115	1	This is help full i like ittttt	5	2025-02-14	positive	0.6369	Google Play
116	1	The is not functional at all?	2	2025-02-12	neutral	0	Google Play
117	1	Make it easy and convienient to use and perfect for all to high prefrence and choice.	3	2025-02-07	positive	0.765	Google Play
118	1	I have been using this app for two years.It is amazing.	5	2025-02-01	positive	0.5859	Google Play
119	1	Always do update and that is annoying	3	2025-01-27	negative	-0.4019	Google Play
120	1	Best app, somehow waiting a few minutes	5	2025-01-23	positive	0.6369	Google Play
121	1	I can't dijitalize my atm in the apollo app on my phone	1	2025-01-22	neutral	0	Google Play
122	1	Whenever I try to sign in app close please fixed it out	2	2025-01-21	positive	0.3182	Google Play
123	1	It's not App it's very slow ehhhh. Why don't you upgrade the app???? It's always zero	1	2025-01-18	neutral	0	Google Play
124	1	Horrible customer service and app crashes Horrible!!	1	2025-01-15	negative	-0.8217	Google Play
125	1	It keeps asking me to turn off developer mode even when dev mode is off. Couldn't use it.	1	2025-01-13	neutral	0	Google Play
126	1	I was using this app for long time it amazing user friendly UI but the i can't found for get pin button in the app	3	2025-01-07	positive	0.5423	Google Play
127	1	Fast and suitable for the customers.	5	2025-01-04	neutral	0	Google Play
128	1	I will give only one star, because it faced with multiple of problems. 1. The app is not as fast as the other banks App, for e.g like CBE 2. The App asks repeatedly to switch off developer options, even if it is switched off. 3. Bank of Abyssinia's services are interesting, but they ignored the issues on the App service. 4. Most customers gave a complain on the App, but no one accept their complain to fix the issue. 5. Lastly, I will not recommend the App unless the issue has been solved ASAP!!	1	2025-01-03	negative	-0.8587	Google Play
129	1	By assessing this you can tell Abyssinia bank has no idea what mobile banking is ?	1	2025-01-02	negative	-0.296	Google Play
130	1	It doesn't work at all.	2	2025-01-02	neutral	0	Google Play
131	1	this app is not available	1	2025-01-02	neutral	0	Google Play
132	1	It's useless app downgraded.	1	2024-12-29	negative	-0.4215	Google Play
133	1	Why is not letting me access my account. The whole point of this app is for me to gey access to my account without physically being at the bank. I would give it a zero but a one will suffice to get my point accross.	1	2024-12-27	neutral	0	Google Play
134	1	When are you going to get rid of this and have a real app that works? By far the worst mobile banking app.	1	2024-12-24	negative	-0.6249	Google Play
135	1	The dirtiest application ever seen...	1	2024-12-20	negative	-0.5267	Google Play
136	1	I love BoA more than anyone but they are cursed when it comed to mobile banking. Even though this ine is hetter it still s*cks! It will ask me to turn off developer options other wise it won't work! I use CBE, Awash birr, tekebirr, Dashen bank and others but non of them asked me this, why only BoA? Please improve your mobile banking, be competitive!	1	2024-12-19	positive	0.9475	Google Play
137	1	Easy and sooo simple to use it, also its easy to stole someones money using the app	3	2024-12-16	positive	0.7003	Google Play
138	1	The worst banking app ever. Never works!	1	2024-12-14	negative	-0.6588	Google Play
139	1	Poorly functioning app	3	2024-12-13	neutral	0	Google Play
140	1	Your system is the worst you should do better	2	2024-12-11	negative	-0.296	Google Play
141	1	It has been a while since you guys started giving the mobile app service but still couldn't get it to work. I'm sure you know that it doesn't work already but not sure if you're lazy or incompetent to fix it. You are losing business because of this. Complacency will have consequences.	1	2024-12-10	negative	-0.6369	Google Play
142	1	This is the best app; many features are awesome, but it should work without the need to turn off the developer options. I'm tired of having to constantly switch the developer options off and on. I've been expressing my struggles about this. I have precious settings enabled in the developer options, and to open the App Boa app, I have to turn them off. Please help us, Abyssinia Bank. I hope you can provide an update soon.	4	2024-12-08	positive	0.9253	Google Play
143	1	Im giving this app one star because there are no options below that. My experience has been incredibly frustrating due to the extremely long loading times, and the app even closes automatically at times. People choose mobile banking for its convenience, but this app is far too time-consuming, making it the worst Ive used. I hope improvements are made to enhance the user experience.	1	2024-12-07	negative	-0.2135	Google Play
144	1	Very unprofessional and mischievous bank in my opinion. I have had several occasions but recently I used Abyssinia Card to withdraw money and it was deducted from my account but despite reporting several times they said they are processing it but I learned yesterday that since it has been 3 months the bank has decided to include it in their income. How absurd. If you can avoid this bank.	1	2024-12-06	negative	-0.6245	Google Play
145	1	It doesn't work on my 2 devices A05 and A34	1	2024-12-02	neutral	0	Google Play
146	1	My attention is very important because it will be the most difficult time for me	5	2024-11-30	negative	-0.1779	Google Play
147	1	I have a worst experience while using this mobile application through out the year. Most of the time it fails to "Login" or automatically closed the app. And also it takes so much loading time (5 minutes +) trying to access the internal services. Sometimes also while transferring within and to other bank also fails. So, BOA please fix your app.	1	2024-11-29	negative	-0.7976	Google Play
148	1	I don't know why but your apps start out great then all of a sudden don't work	1	2024-11-28	positive	0.7684	Google Play
149	1	This application is losing major factions on a daily basis. I can count how many times I have used this app; it is completely useless and disappointing if I am not going to use it in times of need then I don't see the point.	1	2024-11-28	negative	-0.8464	Google Play
150	1	exellent digital transaction of money	5	2024-11-27	neutral	0	Google Play
151	1	The latest update has stopped android 9 phones not to open this App. Never work properly since i started using it.	1	2024-11-26	negative	-0.2263	Google Play
152	1	It needs more improvment	2	2024-11-24	neutral	0	Google Play
153	1	Please this app on my android phone	3	2024-11-20	positive	0.3182	Google Play
154	1	Your app doesn't match your bank, the app is disaster, super slow. Please learn something from tele birr app.	1	2024-11-19	positive	0.2732	Google Play
155	1	The worst app update ever. Why would you include the "developer option off" thing here? Why do you care? It is my phone my money, right? That is the reason why I switched to other banks. So either turn it off or everyone will discontinue their business one by one.	1	2024-11-17	negative	-0.3485	Google Play
156	1	One of the poorest mobile banking system	1	2024-11-13	negative	-0.5423	Google Play
157	1	i find it interesting specially in reciept downloading	1	2024-11-12	positive	0.4019	Google Play
158	1	This app crashes everytime, please fix it	1	2024-11-12	positive	0.3182	Google Play
159	1	star i dont recomend to use this app also the bank	1	2024-11-12	neutral	0	Google Play
160	1	I need a support the app is not working	5	2024-11-12	positive	0.4019	Google Play
161	1	Bast bank of ethiopia	5	2024-11-12	neutral	0	Google Play
162	1	thank you for your social services like, vertual banking, non touch ATM, Cadrless and withdrwal with out passbook...	5	2024-11-12	positive	0.6124	Google Play
163	1	The worst App i have never seen like this before	1	2024-11-12	negative	-0.7359	Google Play
164	1	This app is not available on all android versions and some times it is not functional.	1	2024-11-08	neutral	0	Google Play
165	1	The most useless app, I never expected such an irrelevant app from BOA. big shame!	1	2024-11-04	negative	-0.7569	Google Play
166	1	Professional on banking app	5	2024-11-01	neutral	0	Google Play
167	1	Has some nice interface but always freezes or slow to load .App developers please fix this issue.	3	2024-10-27	positive	0.5719	Google Play
168	1	Please try another because this app doesn't feet the need of this generation	1	2024-10-25	positive	0.3182	Google Play
169	1	What's up I can't log in, what's wrong	5	2024-10-22	negative	-0.4767	Google Play
170	1	Nice to meet you my proud bank in Ethiopia.. I'm a member of this bank, i need to solve my problem of international receiving money for me from my online digital working service's over the world please? I'm working a lot of international money.But i can't get direct in Ethiopia because of don't knowing the legal ways of getting money in Ethiopia please can I get and direct deposit with BoA please ?	5	2024-10-18	positive	0.8717	Google Play
171	1	Terrible Bank Experience Its unbelievable that with all the modern technology, this bank still struggles with even basic transactions. The app constantly crashes, services are limited, and every time I try to transfer money or load Telebirr, theres a huge delay. I have to wait 5 days for failed transactions to be refunded! Even USSD is unreliable. Theyve put me in embarrassing situations countless times, and customer care never fixes anything. Ive switched banks, and you should too!	1	2024-10-14	negative	-0.8395	Google Play
172	1	A painfully slow banking app service. Please don't make it your choice!	1	2024-10-13	negative	-0.3382	Google Play
173	1	If it is possible I would gove0 star	1	2024-10-08	neutral	0	Google Play
174	1	Overall good app but performance needs some improvement also sometimes when using instant other bank transfers it refuses causing to be repeated several times to transfer	4	2024-10-04	positive	0.714	Google Play
175	1	Just make it work please this is embarrassing for a bank of your size	1	2024-10-04	negative	-0.0772	Google Play
176	1	Update to the simplest way it requires the developer option on and off why this is	5	2024-10-04	neutral	0	Google Play
177	1	Stop telling me what to do with my phone, BOA. Why does your newly updated app keep asking me to disable the developer options? Im not slowing down my phone just to use your God damn app.	1	2024-10-04	negative	-0.4215	Google Play
178	1	I'm living out of country how may I download and use mobile banking? It asks me the Ethiopia phone number and I can't receive text to confirm because I'm out side the country. So please lete know if I can use while I'm outside the country. Thanks	1	2024-10-04	positive	0.6997	Google Play
179	1	Great For Financial company	5	2024-09-30	positive	0.6249	Google Play
180	1	The App's crash always.. Error.....	3	2024-09-27	negative	-0.4019	Google Play
181	1	This app is incredibly frustrating to use. Its filled with issues that make it difficult to navigate and complete tasks efficiently. Ive never encountered such a poorly designed banking application before. It needs significant improvements to enhance user experience. It deserves a vey low rating.	1	2024-09-26	negative	-0.2484	Google Play
182	1	Great UI and seamless UX. I love it!!	5	2024-09-25	positive	0.8715	Google Play
183	1	That's too good application but try to add more alternatives and futures or possibilitys for your customers	3	2024-09-25	positive	0.2382	Google Play
184	1	It's easy used to operate program and secured	4	2024-09-25	positive	0.6808	Google Play
185	1	I bought a mobile card on this app but I didn't receive it and it took my money and I didn't get my money back.	1	2024-09-21	neutral	0	Google Play
186	1	Great app with great services	5	2024-09-19	positive	0.8481	Google Play
187	1	The worest app ever made i would not recommende for no one	1	2024-09-16	positive	0.2235	Google Play
188	1	How many hours should I wait after transferring money to telebirr, please do something about the transfer delay issue I need my money when ever.	1	2024-09-15	neutral	0	Google Play
189	1	BOA is unreasonably holding and delaying transactions for more than a day, even transactions within the same bank itself. This is a huge gap that I observed in BOA mobile banking. I didn't experience this kind of challenge while having transactions in other banks' mobile banking platforms. After waiting so long, I called your customer support team and the response they gave me was "it was the system that holds the transaction & will be released on working days". This is not totally fair.	1	2024-09-15	positive	0.4269	Google Play
190	1	It's not working. It needs a big update. Can't you update the app quickly?	1	2024-09-14	neutral	0	Google Play
191	1	I am Aimohon Joel , It's can be Good for a Better Conversation in Time	3	2024-09-14	positive	0.7003	Google Play
192	1	Better app than most mobile apps, but why do I have to turn off developer option every time I wanna use the app?? It's annoying.	1	2024-09-13	negative	-0.4515	Google Play
193	1	It say "The request was not successful. please check device connectivity or try again" why? One of the bank manager told me it is because of my phone's android version which is 9.1 It is ridiculous! Disappointing	1	2024-09-11	negative	-0.8758	Google Play
194	1	How to download or screenshot of payment receipt...what kinda worst app ever	1	2024-09-11	negative	-0.5868	Google Play
195	1	This is not an appropriate app, i don't know how boa develops this app, i don't expect this much crazy and un confortable app form BOA, I'm soory!!!	1	2024-09-07	negative	-0.5067	Google Play
196	1	Shockingly bad! Even when it decides to work, it's painfully slow and frustrating. Such a shame that it has become a stain on an extraordinary bank	1	2024-09-06	negative	-0.9312	Google Play
197	1	It crashes frequently. It launches on Android 8.1 but I don't think it actually works on versions less than 10. If so, it shouldn't be available for download by such devices to begin with, like many other finance apps are not. It was so much better three months ago, upgrades should be for the better.	1	2024-09-06	positive	0.915	Google Play
198	1	Awesome application. But lately its crashing everytime i opened it.	4	2024-09-05	positive	0.3716	Google Play
199	1	Nice looking app but a terrible user experience.	1	2024-09-03	negative	-0.5023	Google Play
200	1	The worest MB app ever!!	1	2024-09-02	neutral	0	Google Play
201	1	Plz fix the Apps ....screenshot lovation hide from glarey share botten not work	1	2024-08-30	positive	0.2023	Google Play
202	1	The worst experience ever	1	2024-08-29	negative	-0.6249	Google Play
203	1	Hi I have problem with this App BOA mobile I don't know what is wrong with this App I did many times download but it's sam doesn't work if sam like that this app way I have to be customer with them how I know my account and checking save The book is no Not enough alone	1	2024-08-28	positive	0.6072	Google Play
204	1	It is not work for my device	5	2024-08-27	neutral	0	Google Play
205	1	I'm Sick and tiered of enabling and disabling Developer Option Everytime I use this app. maybe you know it maybe you dont, fix it please it's anoying	1	2024-08-26	negative	-0.8106	Google Play
206	1	I dont recommand it to any one	1	2024-08-23	neutral	0	Google Play
207	1	The application used to work well. But after updates I'm not able to use the forgot password feature, which is blocking me from accessing it as a whole.	1	2024-08-20	negative	-0.431	Google Play
208	1	Don't trust this bank and its service.	1	2024-08-16	negative	-0.4023	Google Play
209	1	I can not open and use the application,please help me!	5	2024-08-15	positive	0.4574	Google Play
210	1	Despite the enhanced technology you have, the application doesn't work properly, and it asks for the developer option to be turned off, fix that.	3	2024-08-12	neutral	0	Google Play
211	1	Very poor app b/c highly slow to open the app	1	2024-08-12	negative	-0.5256	Google Play
212	1	A total disaster of an app. Always offline, never works, it's embarassing. I've lost hope and taken my business to a competitor	1	2024-08-08	negative	-0.6124	Google Play
213	1	so poor app to use can't start up when open the app	1	2024-08-08	negative	-0.5256	Google Play
214	1	This app takes too long time to be opened. And even it is not working simply as other banks application. Why this app does not give a digital invoice. Even, I am not able to find where the screeshot is kept after transaction. So, please the developer should fix all these.	1	2024-08-07	positive	0.3804	Google Play
215	1	Worst app ever, not user friendly, even doesn't serve basic functionality correctly, takes to much time to login and navigate through the app, we expected more from this bank	1	2024-08-07	negative	-0.7736	Google Play
216	1	I mean how could a big financial company like this, be this much irresponsible to release this app? You should be ashamed!	1	2024-08-06	negative	-0.5848	Google Play
217	1	Is it necessary to switch off developer options every time to use mobile banking?	1	2024-08-04	neutral	0	Google Play
218	1	The previous version is better it doesn't work	1	2024-08-04	positive	0.4404	Google Play
219	1	I don't know what is wrong with BOA as a bank in general. It's been going backwards since last year or so. The app is a disaster to use in every possible way. Not stable to log in and very slow to perform transactions, couldn't take a screenshot (or can't even find the pictures even using its save screenshot option). Most of the time, it fails to perform transactions and so on. Simply, it's the worst!	1	2024-08-03	negative	-0.9198	Google Play
220	1	Take some note from CBE mobile banking app, it's the best banking app currently take some note and improve ur app . Sometimes u have to learn from the bests	1	2024-08-03	positive	0.7964	Google Play
221	1	It's not working as it was , so much need to improve, it was the best but not anymore	2	2024-08-01	positive	0.5499	Google Play
222	1	Not yet completely working this App. i don't know when is it will be working properly! Its Sad!!!	1	2024-07-31	negative	-0.6449	Google Play
223	1	The app does not open sometimes it says coonection issue which i dont have and after it opens it has bugs while using its not smooth to work with please improve it	1	2024-07-31	positive	0.6369	Google Play
224	1	It's not working totally, what a useless app is it,	1	2024-07-31	negative	-0.4728	Google Play
225	1	This app has become the most troubling every day. It doesn't work. I love the bank, and I hate the app	1	2024-07-31	negative	-0.897	Google Play
226	1	this is so disappointing app	1	2024-07-31	negative	-0.6269	Google Play
227	1	it can't even open and only display error messages	1	2024-07-27	negative	-0.4019	Google Play
228	1	uselss app dont download	1	2024-07-26	neutral	0	Google Play
229	1	Is this app fake i try it not working it say please try again later, unable to make transactions what is the purpose of this app . If it is not working delete it	1	2024-07-25	negative	-0.2023	Google Play
230	1	This app didn't work. They have a new version (new app) but still not compatible with my Samsung S8+ , which is v.funny.	1	2024-07-25	neutral	0	Google Play
231	1	Corrupted and poor app	1	2024-07-24	negative	-0.4767	Google Play
232	1	When I try to use the application it says 'developer setting should be off' where is the setting to off this play Still doesn't work for me	3	2024-07-24	positive	0.4118	Google Play
233	1	FIX YOUR Apollo!! You guys where the best	1	2024-07-23	positive	0.6988	Google Play
234	1	Always slow and doesn't work on weekends if you are in a rush or a merchant this app is not for you	1	2024-07-23	neutral	0	Google Play
235	1	It's very difficult to use the user, app,ones dawenload the user can't operate well , no one can help me,	1	2024-07-23	neutral	-0.0049	Google Play
236	1	Poor application. It turned off by itself	1	2024-07-23	negative	-0.4767	Google Play
237	1	It usually crashes and the reason it gives is a problem on internet connection although the internet was fine.	1	2024-07-23	negative	-0.2263	Google Play
238	1	we want international mobile banking	1	2024-07-22	positive	0.0772	Google Play
239	1	screenshot isn't working, Please modify it	2	2024-07-22	negative	-0.2411	Google Play
240	1	Naziriet measho 89160437	1	2024-07-22	neutral	0	Google Play
241	1	Is not working both this one and apollo did u make it better pls am gonne stop using this bank because of the mobile banking	1	2024-07-19	positive	0.25	Google Play
242	1	The App is not working on Android 9.1 at all. It shows an error notification and forcefully closes the app. Must be fixed ASAP.	1	2024-07-19	negative	-0.4019	Google Play
243	1	Crashes very frequently is not stable overall need improvement such a huge bank needs a better app than the current one	1	2024-07-19	positive	0.744	Google Play
244	1	The previous application is much better than this one	1	2024-07-18	positive	0.4404	Google Play
245	1	Worst app. It is wise to invest money and you can make it like CBE app. Even the incon has no image. My app has better UI than yours. So, please invest more and hire professional developer companies and improve it.	1	2024-07-18	positive	0.7713	Google Play
246	1	It is not working at all	1	2024-07-16	neutral	0	Google Play
247	1	The poorest mobile banking survice ever. Only error reports frequently	1	2024-07-16	negative	-0.7351	Google Play
248	1	The worst banking app	1	2024-07-15	negative	-0.6249	Google Play
249	1	The app is constantly crashing and freezing when to send to BOA customers' accounts.	1	2024-07-15	negative	-0.1027	Google Play
250	1	Is ok but stop sundenly	5	2024-07-15	negative	-0.296	Google Play
251	1	Very poor app. Its Always cresh and not compatible	2	2024-07-13	negative	-0.5256	Google Play
252	1	It's not functional at all. It keeps saying "error". Unable to activate.	1	2024-07-13	neutral	0	Google Play
253	1	I can't believe that Abyssinia develop this kind of trash app it have a lot of issues	1	2024-07-13	neutral	0	Google Play
254	1	The new app is very good	5	2024-07-13	positive	0.4927	Google Play
255	1	It's very good but sometimes isn't work probably	5	2024-07-12	positive	0.2724	Google Play
256	1	This is the most stupid app I've seen, why would I turn off developer mode just because you can't make your app secure, this clearly indicates the app has very poor implementation and unskilled developers.. There are a lot of people who need developer option for different reasons. Please for the sake of the bank, fix this thing... Even the most secure international banking apps don't require it. Not to mention the lag and crashes	1	2024-07-12	negative	-0.0672	Google Play
257	1	The worst mobile banking app	1	2024-07-11	negative	-0.6249	Google Play
258	1	The app keeps crashing it stops responding while I'm using it or trying to open the app. Now I have to go to the bank in person to do any banking activities. In short it is the worst mobile banking system in Ethiopia	1	2024-07-11	negative	-0.6908	Google Play
259	1	Pretty good for a banking app, it still lacks some things with in the ui and with the speed of the app but overall it's a good application. Thank you 5/5	5	2024-07-09	positive	0.8793	Google Play
260	1	Error occurred try again for 5 days tele birr user not found	1	2024-07-08	negative	-0.4019	Google Play
261	1	It is so bad apps ,it doesn't work	1	2024-07-06	negative	-0.6696	Google Play
262	1	From now on I will never going to use this app,It is a trash app.No one care about this app from bank I will rate them 0/5.	1	2024-07-06	positive	0.4939	Google Play
263	1	It usually crashes and unable to process also it request to off the developer options	1	2024-07-05	neutral	0	Google Play
264	1	I can't believe in this day and age, one of the major banks of the country can't seem to understand that having a working mobile payment option is a **MUST** to survive. I have decided to move my accounts to CBE and Awash because of this. Can't be bothered with this useless app.	1	2024-07-04	negative	-0.2115	Google Play
265	1	Is it even working these days? Please check it.	1	2024-07-04	positive	0.3182	Google Play
266	1	The app is essentially unusable, it asks to disable developer mode even when it is already disabled and crashes, sometimes it only works with wifi and sometimes only with data, or it crashes just because.......	1	2024-07-04	neutral	0	Google Play
267	1	Please make it functional.	5	2024-07-03	positive	0.3182	Google Play
268	1	its best app but its don't working in poor connection area so	5	2024-07-03	positive	0.7123	Google Play
269	1	Please Recover thank you	5	2024-07-02	positive	0.5859	Google Play
270	1	This app doesn't work	1	2024-06-30	neutral	0	Google Play
271	1	the app used to run fine, but now it takes like forever to even open the main dashboard and sometimes it just crashes on its own. you guys gotta step it up. we need this app to be way faster	1	2024-06-27	positive	0.5647	Google Play
272	1	the underrated app I've ever seen and ur banking system is Soo Idiocracy	1	2024-06-27	neutral	0	Google Play
273	1	It demands to disable developer option.	1	2024-06-27	neutral	0	Google Play
274	1	It's been two months now, I cannot do any transaction using this app. It's really disappointing. I am using bank of Abyssinia currently because it's the nearest bank to my work place. The bank is turning to the worst bank in the country day by day. They always respond to customers that they are updating their system all year long, I think that's what they train their customer service operators to do.	1	2024-06-26	negative	-0.8221	Google Play
275	1	Riddled with crashes, cant use it anymore. Very frustrating!	1	2024-06-20	negative	-0.54	Google Play
276	1	Always error occured. The worst app ever	1	2024-06-20	negative	-0.7783	Google Play
277	1	It has become the most unreliable mibile banking app ever.	1	2024-06-16	neutral	0	Google Play
278	1	The poorest mobile banking I have seen in the industry. Is not stable to login and post transactions. Is not attractive. Error reports frequently.	5	2024-06-13	negative	-0.6742	Google Play
279	1	I like the the bank of Abyssinia is the best first bank of Ethiopia	1	2024-06-11	positive	0.7717	Google Play
280	1	The app is not good need a few work	3	2024-06-11	negative	-0.3412	Google Play
281	1	The worst mob app i have ever seen. Slow, uncomfortable and stupid. It is better to learn from the best app (tele birr). The released updates is even worst.	1	2024-06-11	negative	-0.7964	Google Play
282	1	Unreliable, expensive service. Most of the time, it is not working. Sometimes, it will take more than a day to complete transactions and charges more for this unworthy service. I will not recommend this bank app to anyone.	1	2024-06-10	negative	-0.7929	Google Play
283	1	Developer option to be off really	1	2024-06-06	neutral	0	Google Play
284	1	I'm disappointed with the recent changes to this app. Disabling developer options for functionality seems unnecessary. The previous version offered a more user-friendly experience.	1	2024-06-06	negative	-0.7351	Google Play
285	1	Worest app, it cannot be downloaded	2	2024-06-05	neutral	0	Google Play
286	1	slow only some times the wey it is veary nice app	5	2024-06-05	positive	0.4215	Google Play
287	1	The worst mobile banking app	1	2024-06-04	negative	-0.6249	Google Play
288	1	Wow! what a disgrace for BOA. The app barely works. Too slow and always returns error.	1	2024-06-03	negative	-0.3382	Google Play
289	1	Excited by your service	5	2024-06-02	positive	0.34	Google Play
367	1	The worest mobile banking app	1	2024-05-02	neutral	0	Google Play
290	1	The worst mobile banking app! It doesn't load (seems like with the perfect WiFi and data connection it still manages to have network issues), when you finally get into the app, it makes it so hard more than it should be to send money.	1	2024-05-31	negative	-0.5673	Google Play
291	1	It is Good to save time	3	2024-05-31	positive	0.7269	Google Play
292	1	I'm sorry but what kind of stupid developer thinks the app will be faster if we disable "Developer mode"? I've never seen such degeneracy in my entire life, please get rid of this feature	1	2024-05-30	negative	-0.5006	Google Play
293	1	What is the purpose or point of not allowing to take a screenshot of the recipe after transferring???	1	2024-05-29	neutral	0	Google Play
294	1	I can't use the app unless I turn off developer mode?? What kind of stupid rule is that?? The worst experience for a banking app!!	1	2024-05-26	negative	-0.8844	Google Play
295	1	Sorry to say this compared to other banks mobile app its the worest it need more improvement the app doesn't match the bank standard it need more update its too slow plus it keep saying stop developing option on your phone when no developing setting enabled ??plus when it come to recent transaction nothing to display...	1	2024-05-24	negative	-0.1943	Google Play
296	1	What is that disable developer option I have never seen any app commands.	3	2024-05-22	neutral	0	Google Play
297	1	Please fix the app i doesn't belongs to Abbssinya Bank Name	1	2024-05-22	positive	0.3182	Google Play
298	1	Playstore need to have some option to give 0 stars because this application right here, deserve exactly that, imagine being one of the biggest banks In the country and can't manage to have good mobile application in the Era of mobile money, you guys are in the brink of collapse you better make it right real quick or you gonna be 10 meters down to the grave. DON'T USE THIS APP, IT'S WASTE OF TIME.	1	2024-05-21	negative	-0.5473	Google Play
299	1	It's good when i've downloaded at first. But now it doesn't work well	2	2024-05-20	negative	-0.0698	Google Play
300	1	It's just terrible. It kept crashing in middle of transaction. Hell sometimes it won't open. My phone is stock Android (pixel 8) and I don't even know how this happens. Fix it!	1	2024-05-20	negative	-0.7263	Google Play
301	1	Good but not working top up	5	2024-05-20	neutral	0.016	Google Play
302	1	This app is the most worst app I used in Ethiopia and belive me I know I live in Ethiopia. Being the fincial app It doesn't work when you want it. It makes you wait for cash out code and immediately debit the amount before sending the code I have got to say abysinia bank I didn't expect this from you and I use CBE mobile banking	1	2024-05-18	negative	-0.624	Google Play
303	1	Poor mobile banking alwayes not working alwayes	1	2024-05-18	negative	-0.4767	Google Play
304	1	Absolutely the worst mobile banking app.it crashs every time,problem when logging in and and cuts my balance when top up without even recharging	1	2024-05-17	negative	-0.6983	Google Play
305	1	App is so bad network	1	2024-05-16	negative	-0.6696	Google Play
306	1	It's not working for 3days. Come on as a big bank in Ethiopia this is unprofessionallism from boa	1	2024-05-15	neutral	0	Google Play
307	1	Be careful of using this app to transfer large sums of money. Recently I can't top up my mobile card, can't pay tickets, can't transfer money to Telebirr. The *815# works but what's the use of an app if we're using USSD. It will refund your mobile top up days after failing to top up but I wouldn't want to risk that. I'm a big fan of BoA but I wouldn't recommend this app.	1	2024-05-15	negative	-0.7097	Google Play
308	1	The worst mobile banking app, doesn't even work for a week properly.	1	2024-05-15	negative	-0.6249	Google Play
309	1	77867748 I can't update my mobile banking	1	2024-05-14	neutral	0	Google Play
310	1	Hate how we're expected to disable 'Developer Options' everytime we open the app. An unnecessary point of friction that's been put in place in the guise of security.	2	2024-05-14	negative	-0.3182	Google Play
311	1	I don't get why this app is developed it is not functional at all !!	1	2024-05-12	neutral	0	Google Play
312	1	It is really make my life so much easy!	5	2024-05-12	positive	0.5378	Google Play
313	1	My advice for whoever reading is go look for other bank(awash bank is a great example). This bank won't even allow you to access your money when you want. It has bad servers which don't work(respond) on time.	1	2024-05-11	positive	0.0603	Google Play
314	1	Preventing login because I have developer options on is not security. Moved all my money somewhere else because I just didn't wanna deal with it	1	2024-05-11	negative	-0.2815	Google Play
315	1	The app has bugs. Signing in is still a challenge. Transfer to another bank is impossible. The app is slow and bland.	3	2024-05-11	positive	0.0772	Google Play
316	1	Why do u force me to Turn OFF developers option just to use your app its not fair and am not using ur app anymore	1	2024-05-10	negative	-0.2411	Google Play
317	1	Very poor app. It crashes every time, doesn't load properly, and you can't even buy airtime. The programming is subpar. Please take lessons from other online banking apps. I would give it a zero if I could!!	1	2024-05-10	negative	-0.3973	Google Play
318	1	This app is very simpl for useing	4	2024-05-10	neutral	0	Google Play
319	1	Very laggy un able to make transactions Fix it	1	2024-05-10	neutral	0	Google Play
320	1	After recent update the app keeps asking to disable developers options and won't let you use it unless you do.	2	2024-05-10	neutral	0	Google Play
321	1	Great UI UX Design !!!	5	2024-05-09	positive	0.7163	Google Play
322	1	App is any updates why?	5	2024-05-09	neutral	0	Google Play
323	1	I am an app developer, I need to keep developer options on... WHY ARE YOU ASKING ME TO TURN DEVELOPER OPTIONS OFF... why is it that Abyssinia is the only damned bank in Ethiopia that just can't seem to buld an app that works... it's not that hard people, just look at CBE... this is simply terrible, borderline unusable!	1	2024-05-09	negative	-0.6904	Google Play
324	1	UGH they are super calculative when it CM 2 Mobile-banking or any online stuff. If ur degital!! better chose other bank.	1	2024-05-09	positive	0.5928	Google Play
325	1	It takes a very long time to log in please fix	1	2024-05-08	positive	0.3182	Google Play
326	1	It's not functional at all	1	2024-05-08	neutral	0	Google Play
529	1	this app doesn't fit the bank	1	2024-02-10	negative	-0.2755	Google Play
327	1	What's wrong with App. this days? it doesn't working properly. 1) it's VERY SLOW & doesn't open. it's very Annoying. 2) most of the time it says repeatedly Please try it again or try it later but again and again it doesn't open or work. 3) repeatedly it says something went wrong then it off the screen. I've updated the App. when it needed but nothing changed. PLEASE if it has some issues with the App. Please fix it otherwise I'm going to uninstall it.	2	2024-05-08	negative	-0.7816	Google Play
328	1	It crash repeatedly! Try to make it more stable for customers need meet!	2	2024-05-07	negative	-0.2001	Google Play
329	1	After two weeks it require update why?	5	2024-05-07	neutral	0	Google Play
330	1	It keeps crashing and hasn't been fixed	1	2024-05-07	neutral	0	Google Play
331	1	The application is full of bug, so annoying.	1	2024-05-07	negative	-0.541	Google Play
332	1	Why is the app asking me to remove developer options? Why does it matter what I do with my phone , this is unacceptable! Fix this	3	2024-05-06	negative	-0.4926	Google Play
333	1	Worst application relative to other Ethiopia mobile banking app	1	2024-05-06	negative	-0.6249	Google Play
334	1	"I am extremely disappointed with the poor service I have received. It is unacceptable that I cannot make transactions of 30,000 Birr and sometimes my money gets stuck in the air. As a result of your incompetence, I have been forced to change my bank account. This level of service is completely unacceptable and needs to be rectified immediately."	1	2024-05-06	negative	-0.9628	Google Play
335	1	Doesn't work properly, keeps closing won't activate any account, I wouldn't recommend downloading	1	2024-05-05	negative	-0.2755	Google Play
336	1	Pls improve your mobile banking app it's doesn't work constantly after i updated the new version of your app try to improve	1	2024-05-05	positive	0.7269	Google Play
337	1	The version 24.04.26 is not opening on any of my devices. I noticed this issue on my friend's Android 9 phone and also on my Samsung Android 12 phone. Even after weekly updates, the newest version is not working properly. Please provide a stable version update, as I prefer the older version of the app from the new one.	1	2024-05-04	positive	0.0613	Google Play
338	1	This app is not working!!	1	2024-05-04	neutral	0	Google Play
339	1	this app not work why?pleas tell me	2	2024-05-04	neutral	0	Google Play
340	1	I am comfortable with your good service	5	2024-05-04	positive	0.7351	Google Play
341	1	best app from any mobilebanking	5	2024-05-04	positive	0.6369	Google Play
342	1	It crushes repeatedly	1	2024-05-03	negative	-0.4404	Google Play
343	1	Very bad app as always bothering any transaction processes.	1	2024-05-03	negative	-0.7501	Google Play
344	1	I prefer the earlier version. This updated app crushes during login and says there is bug. Please fix the bug issue.	4	2024-05-03	negative	-0.1531	Google Play
345	1	Soo many bugs on this app I haven't been able to use it since I installed it very bad	1	2024-05-03	negative	-0.5849	Google Play
346	1	This application isn't working properly	1	2024-05-03	neutral	0	Google Play
347	1	This is too poorer than the previous app.	1	2024-05-03	negative	-0.3612	Google Play
348	1	The app keeps crashign again and again, i didn't even get to sign in. Worst update!!	1	2024-05-03	negative	-0.6892	Google Play
349	1	Developers/ the company takes too long to update the app, and throughout that process, the app is basically useless. We can't send money or even be able to check our account. They even take it down from the Play Store for a while. This whole process usually takes them 3 to 5 days. This is very disappointing. It is an improvement from the previous version of the app, but they still have a long way to go to compete with the likes of CBE. Transferring to other banks sometimes doesn't work.	2	2024-05-03	positive	0.5029	Google Play
350	1	Was working ok.but it started not displaying banks list to choose from, and it needs updating every couple of days, annoying	3	2024-05-03	negative	-0.4019	Google Play
351	1	Dear BOA, Are you sure you are upgrading your application. It is becoming worse and worse. Please fix the bug as quickly as possible.	1	2024-05-03	neutral	0	Google Play
352	1	Nice one thanks abisiniya	5	2024-05-03	positive	0.6908	Google Play
353	1	it doesnt work it crashes	1	2024-05-03	neutral	0	Google Play
354	1	It keeps clashing down What a crass stupid app is this... You forced me to update after I transferred money and now I can't open it	1	2024-05-03	negative	-0.7506	Google Play
355	1	Crash... glitch... crash... blame connection... crash... crash again. Please fix it	1	2024-05-02	negative	-0.4215	Google Play
356	1	So unreliable i had to send money asap but this app either laggs or doesn't work such a lazy work look at how efficient tele birr is and its not even a bank	1	2024-05-02	positive	0.748	Google Play
357	1	Great app than others	5	2024-05-02	positive	0.6249	Google Play
358	1	OMG this is like the worst mobile banking app ever. I have many different mobile banking app from different banks but this is the worst so far. It says it has connection issue when I have wifi or data connection and while I'm using other social media apps. It keeps asking me for update once like every week and takes forever to load like I have to wait at least 10 minutes to login and another 10 min to see my balance.	1	2024-05-02	negative	-0.2382	Google Play
359	1	I think I remember it worked once upon time...	2	2024-05-02	neutral	0	Google Play
360	1	This app is going to the worest boa app ever It crushes every time login.	1	2024-05-02	negative	-0.4404	Google Play
361	1	The app never worked properly, specially on android 14, do better	1	2024-05-02	positive	0.4404	Google Play
362	1	all the time updated but im not satisfy by boa mobile bancking	1	2024-05-02	negative	-0.4973	Google Play
363	1	Worst app ever. Barely works	1	2024-05-02	negative	-0.6249	Google Play
364	1	It keep making me out and crash when i open the app and not working properly	1	2024-05-02	negative	-0.4019	Google Play
365	1	After last update, the app keeps crashing, not working. Pls fix it. Mobile transactions become impossible.	1	2024-05-02	negative	-0.0572	Google Play
366	1	I don't know why every time you come up with a new update the app get worst than the oldest, it is taking more time to load, can load money to telebirr, can't pay awach. Please try to fix it.	1	2024-05-02	negative	-0.6971	Google Play
368	1	It was working good before the last update but after the update it asks to disable developer option. why is that? That means any developer with developer option enabled can't access his account. It crushs a lot of times.	2	2024-05-01	positive	0.2382	Google Play
369	1	From Ethiopian Internet banking Abbisiniya Internet banking application is the most worst boring and slower app, please fix that	1	2024-05-01	negative	-0.688	Google Play
370	1	good App and user friendly.	4	2024-05-01	positive	0.7269	Google Play
371	1	Every time needs update & after that it's not working it's too boring	1	2024-05-01	negative	-0.3182	Google Play
372	1	What mean disable developer option?	5	2024-05-01	neutral	0	Google Play
373	1	Slow login, crashes frequently, annoying app ever. Since you updated this app, it's been extremely unhelpful.	1	2024-05-01	negative	-0.4019	Google Play
374	1	why do we need to turn off "developer options" in order to use your app, on the new update??? Are we suppose to not use our device for other purposes just so we can use your app? It is not security it is BS. (fix that and I will update my rating)	1	2024-05-01	negative	-0.4581	Google Play
375	1	Annoying it doesn't work totally	1	2024-05-01	negative	-0.4019	Google Play
376	1	The Worst application ever	1	2024-05-01	negative	-0.6249	Google Play
377	1	The best beautiful app	5	2024-05-01	positive	0.8442	Google Play
378	1	Keeps crashing everytime what a disaster	1	2024-05-01	negative	-0.6249	Google Play
379	1	It doesn't work anymore	1	2024-05-01	neutral	0	Google Play
380	1	The app is terrible, nothing functions properly. Especially since the latest update, it crashes all the time.	1	2024-05-01	negative	-0.4767	Google Play
381	1	It's good app but the system is not same as CBE bankin mobile When i compare To these apps BOA and CBE, CBE is the best up	1	2024-05-01	positive	0.8294	Google Play
382	1	Please focus on the functionality of the app instead of spending money on the advertisements.	1	2024-05-01	positive	0.3182	Google Play
383	1	Frequently crashing fix it please	1	2024-05-01	positive	0.3182	Google Play
384	1	95% of the time it crashes	1	2024-05-01	neutral	0	Google Play
385	1	The worst update ever You don't deserve one star;	1	2024-05-01	negative	-0.6249	Google Play
386	1	No feature works correctly. Its always buffering and needs probably high data. So its useless	2	2024-04-30	negative	-0.6461	Google Play
387	1	This app is trash, it's not working for the past 3-4 days. I've to go to the bank to send money to other banks. Plus the app keeps crashing since the last update. BOA as a bank is deteriorating! This has to change.	1	2024-04-30	neutral	0	Google Play
388	1	App needs a lot of work. It continuously crashes and shuts down.	1	2024-04-30	neutral	0	Google Play
389	1	Not comfortable with this version. Its hard to down it load Developer option is not allowed to use it as usual.	5	2024-04-30	negative	-0.477	Google Play
390	1	This app is so annoying as the previous version.	3	2024-04-30	negative	-0.541	Google Play
391	1	Need many improvements	2	2024-04-30	positive	0.3182	Google Play
392	1	Great always great!!!	5	2024-04-30	positive	0.8772	Google Play
393	1	Such a junk application, its not working at all. Waste of time	1	2024-04-30	negative	-0.4215	Google Play
394	1	Hello is this new update cuz it keeps kicking me out!!!!! can't make a transaction fr!	3	2024-04-30	neutral	0	Google Play
395	1	you guys keep on releasing unstable app, now it won't login	2	2024-04-30	negative	-0.3612	Google Play
396	1	I never ever seen the worst commercial app like this in my life , it does not work anything , i donot know how the IT Team of the bank tested and launch the app. Its annoying !	1	2024-04-30	negative	-0.68	Google Play
397	1	The best bank with the worst application and ussd service.	1	2024-04-30	neutral	0.0258	Google Play
398	1	The old version is best. This one is so lagging and it's not fast to quick transfer	1	2024-04-30	positive	0.3525	Google Play
399	1	The latest update has a bug it keeps crashing. Please fix it it's so inconvenient to do our business this way. That or we will switch to other banks	3	2024-04-30	negative	-0.2062	Google Play
400	1	Amaizing Bank in Etthiopia	5	2024-04-30	neutral	0	Google Play
401	1	It doesn't function properly!! You don't even deserve one star.. please stop playing your dirty game on your customer...	1	2024-04-29	negative	-0.3786	Google Play
402	1	That's a fantastic app! L	2	2024-04-29	positive	0.5983	Google Play
403	1	This app has been found useless while I compared with the first version of IB12111...that was very good, you guys what is the matter with you. You are far from the technology and the competetor's digital product through convenience, reliable, easeness _-dashen, cbe, zemen... they are doing well! share their experience and be able to satisfy your esteemed customers including me. unless you will be down soon!	1	2024-04-29	positive	0.8828	Google Play
404	1	I have never seen the worst mobile app like this	5	2024-04-29	positive	0.6998	Google Play
405	1	This app isn't working well on Tecno phone . what is the error??	1	2024-04-29	negative	-0.5959	Google Play
406	1	With every update the app keeps on getting worse,it is filled with bugs	1	2024-04-29	neutral	0	Google Play
407	1	Not working properly why?????????	1	2024-04-29	neutral	0	Google Play
408	1	The update app is the worest one when i compare with past.	1	2024-04-28	neutral	0	Google Play
409	1	It's nice, the stack thing needs update thou	5	2024-04-28	positive	0.4215	Google Play
410	1	This application is relatively good even if some times interpreted.But apolo is difficult application please improve it.	5	2024-04-28	positive	0.6808	Google Play
411	1	The app is not properly working.	3	2024-04-28	neutral	0	Google Play
412	1	It is always crushing it loged me out all the time	1	2024-04-28	negative	-0.3612	Google Play
413	1	I love boa but the mobile app isn't as good as the older version when the app gets update it gets worse and worse it doesn't even work..fix the issue with that	2	2024-04-28	negative	-0.8692	Google Play
650	2	good in bankin at any time & any where.	5	2025-09-13	positive	0.4404	Google Play
414	1	Why Why Why???? it is difficult to make transactions, it takes alot of time to make payments, i thought the update will make it work, but it got worse. please fix it	1	2024-04-28	negative	-0.6007	Google Play
415	1	the worst app I have ever used, I could've given 5 star if it worked properly even just for logging in and check my accounts. seemed that's impossible	1	2024-04-28	negative	-0.6249	Google Play
416	1	Very slow response , try to some updates in the application	1	2024-04-27	neutral	0	Google Play
417	1	useless app. bank to bank transactions do not work at all, wallet topups like telebirr take hours to reach. what a shame from a bank this big.	1	2024-04-26	negative	-0.5106	Google Play
418	1	Really work very good app l like you BoA	5	2024-04-26	positive	0.7368	Google Play
419	1	The worst App I have ever seen.	1	2024-04-25	negative	-0.6249	Google Play
420	1	I tried it with different phones, it only worked for about a week and then it stopped working. It needs some serious work.	1	2024-04-25	negative	-0.296	Google Play
421	1	The onky defect is that it is too slow	3	2024-04-25	negative	-0.34	Google Play
422	1	Sorry to say it is very poor apps I have decided to suspend the BoA account	1	2024-04-25	negative	-0.7178	Google Play
423	1	Boa is the best app but Please Clear Instant or Not instant option of send money be for Asked !!!	5	2024-04-24	positive	0.8698	Google Play
424	1	Installed the latest version of this app on my Android 14 device, but it is not working. I have already received the activation key from your branch (via SMS), but couldn't activate it. It is a failed app. I bet you don't have QA testers.	1	2024-04-24	negative	-0.6652	Google Play
425	1	This is not functional at all, it takes forever to make a transaction,please improve it.	1	2024-04-24	positive	0.4404	Google Play
426	1	I can't update the enable button not open.	1	2024-04-24	neutral	0	Google Play
427	1	The Bank I always love and work with them is priceless	5	2024-04-24	positive	0.6369	Google Play
428	1	BOA app was one of my favourite back in the days, now I don't if there is an app worsen that this.. very very bad. You need to fix it or remove it.	1	2024-04-24	negative	-0.8111	Google Play
429	1	This app is very wonderful	5	2024-04-24	positive	0.6115	Google Play
430	1	It is not working at all.	1	2024-04-24	neutral	0	Google Play
431	1	I've never seen a very worst mobile banking system like this, i lost 37000 birr because of your delay transaction system, i called 8397 and they told me stay for confirmation but, after i changed my mind and waiting for confirmation call to cancel the process they sent it with out my approval, so please don't use the mobile banking system please	1	2024-04-23	positive	0.9035	Google Play
432	1	In Ethiopia pest Bank	5	2024-04-23	neutral	0	Google Play
433	1	Only problem is often it has connectivity issues.	5	2024-04-23	negative	-0.4019	Google Play
434	1	Not bad but please make it lite pls	1	2024-04-23	neutral	-0.0176	Google Play
435	1	It says "Something is wrong with your internet banking user, go to your nearest branch" It hasn't been working since April 13.	1	2024-04-22	negative	-0.4767	Google Play
436	1	I like this bank by his activity and respect castemers i look like my house	5	2024-04-22	positive	0.7964	Google Play
437	1	very fast also nice app i love it	5	2024-04-22	positive	0.8055	Google Play
438	1	By far the nicest looking app by an Ethiopian Bank. But it's functionality is weak. It is full of Transaction error, Function Error. Kudos, but it needs more backend work.	2	2024-04-22	negative	-0.6597	Google Play
439	1	Not reliable always with some issues	1	2024-04-22	neutral	0	Google Play
440	1	So BoA, your last application was horrible and buggy. And we thought "finally!! a functional new app with better UI." But It didn't last long, a non existent connection error at login.... Please just fix your app to the simplest functional form and it would be up to your other service standards.	1	2024-04-21	negative	-0.3578	Google Play
441	1	It has good backgroud and simple. But keeps saying no conectivty , login, Close immediately you made it porly not woriking on stable network!!!	1	2024-04-21	negative	-0.6197	Google Play
442	1	It was working fine a couple of days ago, in the utilities section of payment it only provides a few services but that is OK for now but my issue is it has started crashing down these past 2 days	2	2024-04-21	positive	0.6485	Google Play
443	1	This app is awesome, I like the features	5	2024-04-21	positive	0.765	Google Play
444	1	The app is a total waste of time, it glitches, doesn't log in fast, super slow.	1	2024-04-21	positive	0.2732	Google Play
445	1	Not work this app ...what is the problem	1	2024-04-20	negative	-0.4019	Google Play
446	1	the new updated app exception handling for connection fluctuations is so exhausting which lead users to login repeated times.	1	2024-04-20	negative	-0.5009	Google Play
447	1	Some problem this app,	1	2024-04-20	negative	-0.4019	Google Play
448	1	It's good app tnx for u new update it's very easy to using this app they add some future tnx Abyssinia bank	5	2024-04-18	positive	0.8516	Google Play
449	1	A lot of the app's features have been rearranged but sometimes it works sometimes it doesnt...and that makes it less reliable specially at times of need...pls improve it	2	2024-04-18	positive	0.5927	Google Play
450	1	Now am confused upgrade or downgrade	1	2024-04-17	negative	-0.3182	Google Play
451	1	Can you please just make it functional. I don't think anyone cares how good it looks if not a single functionality works. Plus it's not even aestheticaly nice. The loading animated icon has white irregular edges because the logo wasn't cut out correctly. The app doesn't work at all. It doesn't even login. It gets stuck on login just showing the logo animation and blames the issue on connectivity. Connectivity is fine and the proof is that this review is posted.	1	2024-04-15	negative	-0.1774	Google Play
452	1	The app is not showing my balance or any transaction it is like corrupted showing usd amounts	1	2024-04-13	positive	0.3612	Google Play
453	1	it's so slow app please fix it	2	2024-04-13	positive	0.3744	Google Play
454	1	The most terrible mobel banking app in the world it is not working ones in a week	1	2024-04-13	negative	-0.5256	Google Play
731	2	screenshot problem must be fixed!!	4	2025-08-02	negative	-0.508	Google Play
455	1	Ultimately, the worst mobile banking experience ever left me feeling exasperated and disillusioned.Its a nightmare	1	2024-04-13	negative	-0.7506	Google Play
456	1	The updated version of this app is just time wasting. It doesn't work with 2G/3G network.require log in frequently,not fast as much as possible.automatic log out are the bad features of this app	1	2024-04-13	negative	-0.7351	Google Play
457	1	Abissiniya bank one of the best for giving the future	5	2024-04-12	positive	0.765	Google Play
458	1	This the best mobile banking App BOA mobile banking included all digital banking features and we can access the most companies and sectors with this App. Thanks for giving this services Keep going .	5	2024-04-12	positive	0.8591	Google Play
459	1	This has to be your worst app ever, damm so many bugs and it lags so baddd. Please fix it	1	2024-04-12	negative	-0.6151	Google Play
460	1	Simplify your life by using the Abyssinia app I like it because it is comfortable and safe	5	2024-04-11	positive	0.8271	Google Play
461	1	General, when I considered from other banks, this bank is unique	4	2024-04-11	neutral	0	Google Play
462	1	wow its so attractive	5	2024-04-09	positive	0.7902	Google Play
463	1	Yet another useless app	1	2024-04-09	negative	-0.4215	Google Play
464	1	It closes playing audio app when it is opened . What is the solution?	5	2024-04-06	positive	0.4767	Google Play
465	1	OTP should be inserted manually. not working on my phone	2	2024-04-02	neutral	0	Google Play
466	1	my device is not auto inserting The OTP, So keyboard should be enabled on the apps OTP login to insert OTP Manually.	3	2024-04-02	neutral	0	Google Play
467	1	What's wrong with app suddenly stoped to open?	1	2024-03-25	negative	-0.4767	Google Play
468	1	Just use other banks if you want a good mobile app. CBE is 40X faster and safe than this app.	1	2024-03-23	positive	0.7269	Google Play
469	1	Worst app ever previous version was way better than this version after I activated my mobile banking app it says account not found but I'm their system my IB customer does work fine please fix your bugs and test it before you release it I have visit and report many branches and head quarter but they can't fix the problem	1	2024-03-23	positive	0.7534	Google Play
470	1	The app doesnot allow to transfer from foreign currency accounts to local currency accounts , it says transaction not allowed , please check it and also it is difficult to activate the app from abroad countries since the otp doesn't reach by sms and it uses email, it doesn't allow manual otp input and the email hardly received , please review your app and make an update !!!	2	2024-03-22	negative	-0.5535	Google Play
471	1	I have nothing against your service but your App!!!!??? When will it ever work? Why do you keep changing the interface whenever there is an update? The most unreadable annoying app.	1	2024-03-22	negative	-0.7961	Google Play
472	1	When writing amounts z app cannot insert deceimasl so that one cannot transact amounts involving cents !!! A finnacial app to be released without this feature being checked !!!	3	2024-03-20	neutral	0	Google Play
473	1	BOA mobile the best App	5	2024-03-20	positive	0.6369	Google Play
474	1	worst banking app i have ever used. Try to modify it	2	2024-03-19	negative	-0.6249	Google Play
475	1	The application is extremely slow.	1	2024-03-16	neutral	0	Google Play
476	1	I couldn't transfer because of bug's its annoying for a bank app nots acceptable	1	2024-03-15	negative	-0.1027	Google Play
477	1	It was a very nice app and was exemplary to other banks, but I am experiencing difficulties in transfering transactions and thinking to leave Abyssinia? What would you advise me.	5	2024-03-14	negative	-0.2625	Google Play
478	1	This app is a good app	5	2024-03-14	positive	0.4404	Google Play
479	1	Always there a problem with this app it says check your connection while connected	1	2024-03-09	negative	-0.4019	Google Play
480	1	A little faster than before . Thanks	5	2024-03-05	positive	0.4404	Google Play
481	1	The worst mobile banking app like the previous one. How long it would take for BOA to develop a good app?????? Years or decades?	1	2024-03-04	positive	0.3094	Google Play
482	1	Was good at first but now i couldn't reach my apollo account in the mobile banking app	1	2024-03-03	positive	0.2117	Google Play
483	1	I don't know why they roll out new updates without making sure it works! Why???? Do they need to update to a new staff? Perhaps pay for a better network?? Mindenew? I don't know there always a problem with this app.	1	2024-03-02	negative	-0.529	Google Play
484	1	Best version of boa apps	1	2024-03-02	positive	0.6369	Google Play
485	1	Its amazing and easy to use , but from these two past days it crashes and tells me "there is not enough connectivity" while my internet was good enough , and i can't open it anymore !! Fix this proplem ASAP.	5	2024-03-02	positive	0.8309	Google Play
486	1	After the recent update the application keeps crashing when I tried to open. Please fix.	1	2024-03-01	positive	0.3182	Google Play
487	1	The worst mobile banking app ever!!! I have tried to transfer 25,000 from my BOA account to my CBE and it still hasn't reached my CBE account yet. When I tried contacting customer support they just tell me it's a problem with the system. I have waited 48 hours and I still haven't received my money. Bank of Abyssinia the worst bank and system, I don't recommend this app or bank to anyone.	1	2024-03-01	negative	-0.9097	Google Play
488	1	More interactive and easy to use mobile app	5	2024-02-29	positive	0.4877	Google Play
489	1	Thank you for wasting my time Abyssinia.	1	2024-02-26	negative	-0.0516	Google Play
490	1	Overrated service and recently glitching service system not being able to withdraw funds.	1	2024-02-26	neutral	0	Google Play
491	1	User friendly at it's best with the best security option.	5	2024-02-24	positive	0.9325	Google Play
492	1	It's a quiet good and smoothly accessible app which allows users to transfer , Airtime Top-up, ATM withdrawal and Utilities payments.	5	2024-02-24	positive	0.4588	Google Play
528	1	I sm a big fan of BOA , but the mobile banking is so trashy( sorry but its the best word to discribe it).... please buy a good server ....it always show blank age after login slecially on sundays it does not work at all...the new update has a good UI but has same respose problem ....	3	2024-02-11	positive	0.9285	Google Play
493	1	This app is not efficient and can't be used for people outside Ethiopia. I am not able to enter back my OTP code into the App screen as it gets frozen and nothing can be done. Also the login screen forces to enter a local cell phone in Ethiopia and a PIN number. Those of us who live abroad are left out. The previous application with BoA Authenitcater was working efficiently and I was also able to login using my LapTop. I recommend the Application to use login user name & email instead of Ph#.	1	2024-02-23	positive	0.4885	Google Play
494	1	Worst application I ever used	1	2024-02-23	negative	-0.6249	Google Play
495	1	Wow bank of Abyssinia great job I really like the updated version of Mobile banking specially it allows me to transfer 500000 birr	5	2024-02-23	positive	0.8932	Google Play
496	1	It is easy to use and very fast app	5	2024-02-23	positive	0.4404	Google Play
497	1	It is better than before and i like it	5	2024-02-22	positive	0.6597	Google Play
498	1	Abyssinian mobile banking the latest one	5	2024-02-22	neutral	0	Google Play
499	1	The receipt download option is very convenient.	5	2024-02-22	neutral	0	Google Play
500	1	I used to access my Apollo account through the app before the update but now i can't access my Apollo account through this app and for me this is a step taken backwards!!!!!	3	2024-02-22	neutral	0	Google Play
501	1	It is very bad app. not friendly usable. needs extremely strong network. Can't be updated easily.	1	2024-02-21	negative	-0.5946	Google Play
502	1	Definitly better than the privious version but this one crashes frequently and needed to put to sleep on andrioid version 9	2	2024-02-20	positive	0.2382	Google Play
503	1	Its nice platform when i compare with the previous version! But, when i try to use mobile banking the app states use the updated one! As it orders, i updated BOA from playstore, when i try to use mobile banking on the following day the same thing-update from the playstore!!!!	5	2024-02-20	positive	0.471	Google Play
504	1	The app got a better features and easy to use.	5	2024-02-20	positive	0.7003	Google Play
505	1	I have a great experience using this App	5	2024-02-19	positive	0.6249	Google Play
506	1	Best app but after the update the screenshot not working	4	2024-02-19	positive	0.3818	Google Play
507	1	It was good and more secured mb app but this new version apk i can't find it on play store will you tell me what i have too do ...please	5	2024-02-19	positive	0.7224	Google Play
508	1	I have a fitayah account, a type of interest free account, and because their system is unable to process anything for people like me I can't see any of my accounts in the account list on any transaction, although I can see it when performing security actions or checking my balance, as such this app is as useless to me as the previous one. Unbelievable	1	2024-02-18	positive	0.8481	Google Play
509	1	It doesnt send birr immediately to anything	1	2024-02-17	neutral	0	Google Play
510	1	So this updated version is so much better and faster but it doesn't open unless it's directly opened from play store. fix this issue I'd give it 5 if it wasn't for this	3	2024-02-16	positive	0.6357	Google Play
511	1	Horrible, your apps are getting worse and worse	1	2024-02-16	negative	-0.8658	Google Play
512	1	This is terrible app. What the hell is your problem. Passwords can't be entered manually. I'm abroad. I don't have my Ethiopian Sim. I'm receiving the activation code via telegram. But you locked the system not to accept the activation OTP manually. Hence, I can't see my accounts, I can't make transactions etc.... how can you not think of this in advance.... now I'm in a terrible situation. I can't know what is going on with my account. WOULD YOU FIX IT NOW.... NOT TOMORROW or THE DAY AFTER...	1	2024-02-16	negative	-0.9123	Google Play
513	1	I can't use it anymore	3	2024-02-16	neutral	0	Google Play
514	1	update screenshot screenshot	4	2024-02-15	neutral	0	Google Play
515	1	Very good app its easy to use	5	2024-02-15	positive	0.7264	Google Play
516	1	Its very slow and fail to load any transaction	2	2024-02-15	negative	-0.5809	Google Play
517	1	Great graphics, but why my music have to stop when I open this app? Make it make sense. But overall, it's good, but also needs too much data just to load this app. We might need a lite version of this.	3	2024-02-15	positive	0.5574	Google Play
518	1	Was working fine for 2 days then Error the request was not successful please check your connectivity or try again my connection works perfectly i reinstalled the app called support multiple times all of them said it's a system problem be patient it has been a week since then, called again they even dared to say the problem is your phone restart it which i did but still the same other banking apps work perfectly but this my experience with this app, horrible the whole system is bad	1	2024-02-14	negative	-0.7111	Google Play
519	1	It is good &fast to open!!	5	2024-02-14	positive	0.5399	Google Play
520	1	It is the worst app that I have ever downloaded. It crushes every time I log in	1	2024-02-14	negative	-0.7906	Google Play
521	1	The keyboard not Working please fix it	1	2024-02-14	negative	-0.2411	Google Play
522	1	When we come to use mobile banking app this app is the WOREST one. Who made this app? Why? im almost forget to use it While the app right infront to my phone. I preffered to go branch office rather than to use it. Let alone for transaction or other service for simple purpose to check my balance i used to call for the bank 'call center' rather than to open for this difficult app. It need high speed internet service, it stop service for simple interuption of the network, after transfer the 1/2	1	2024-02-13	negative	-0.793	Google Play
523	1	You should include manual OTP input!	1	2024-02-13	neutral	0	Google Play
524	1	Worst App it ain't allowing yo activate not even in the nearest branch are able to activate it. I have been client of the bank for 10years. What is this BoA? As we know it being a leading in simplifying banking service this App needs to be fixed. Then we will give it better rate,	1	2024-02-13	negative	-0.296	Google Play
525	1	The app does not work well from abroad, there have been continuous upgrades and updates that are very interruptive and non-responsive. Staff do not have the technical capabilities to support whereas the support number and online support are never available.	1	2024-02-12	positive	0.5984	Google Play
526	1	App good. how money transfer tele birr agents	1	2024-02-12	positive	0.4404	Google Play
527	1	Wow, that's an awesome app	4	2024-02-11	positive	0.836	Google Play
530	1	The updated version is nice one BOA always #1 bank	5	2024-02-10	positive	0.4215	Google Play
531	1	As usual the app is ok, but this time i can't update it normally. It lags at 99% all the time. Hope it's fixable.	4	2024-02-10	positive	0.296	Google Play
532	1	You have made a great application that is easy to use	4	2024-02-08	positive	0.7906	Google Play
533	1	More easy and secure fast app than previous one	5	2024-02-08	positive	0.7056	Google Play
534	1	It's much better now effoyee...	5	2024-02-06	positive	0.4404	Google Play
535	1	What an awesome app! It is supper easy to use with very attractive GUI. But there are some problems to be addressed: (1) It crashes frequently and requires mobile cache to be cleared to relaunch. (2) Automatic OTP input is good. But fix the manual activation option, too. (3) It does not boot fast. (4) There are minor errors during the installation. (5) Color contrast: In the transactions menu, the credit accounts should be in dark green than light green. The debit accounts should be in dark red.	5	2024-02-06	positive	0.7957	Google Play
536	1	I am having a challenge to use the app. The app does not allow to update the previous app. Neither does it allow to manually insert OTP - BoA please modify the app to allow these features	3	2024-02-06	negative	-0.1022	Google Play
537	1	I Don't Like It Once U Open It's open did Not Ask U The Pin when u get back Not Safty the Old Version Is More Secured	2	2024-02-06	positive	0.2223	Google Play
538	1	Simple, fast and easy to use. I had bad experience on apollo and the older version of this app is too slow.	5	2024-02-05	negative	-0.1531	Google Play
539	1	Much better and easy to access then the last boa app	5	2024-02-05	positive	0.7003	Google Play
540	1	Not working properly always loading !	3	2024-02-04	neutral	0	Google Play
541	1	Tnx for updating the app its easy and fadt	5	2024-02-04	positive	0.6124	Google Play
542	1	I think this one is better than the prvious one much faster but try to make it more faster like nib and cbe specially nib bake their app is very nice but the bank is not anyways good job on this one	5	2024-02-04	positive	0.7683	Google Play
543	1	One of the weakness in BOA is it's mobile App. I hope this will address some of them, but it is very critical to work on modernizing and ensuring the security of it's mobile banking system in this digitalized world	3	2024-02-04	positive	0.3422	Google Play
544	1	Please add an option to manually input the OTP. I am residing outside of Ethiopia. I encountered difficulty accessing my account following the recent update (change) of your mobile banking app. Unfortunately, I am unable to activate the app on my mobile device. During the activation process, the app prompts for an OTP, which I can receive via Telegram. However, there is no option to manually input the OTP. I kindly request your assistance in resolving this matter and activating my account	3	2024-02-03	positive	0.3016	Google Play
545	1	Why the app doesn't allow to update the previous version. In addition to this, when I install the new version and try to activate, the app doesn't allow to write the activation OTP code to the screen. I have received the OTP password from telegram and email. Would you please fix this bug. Thank you	1	2024-02-03	positive	0.3544	Google Play
546	1	I don't have words for your great work.. Really Good .what i like the most is the screenshots features is included which gives you the transactions detail ...Great Work...KEEP IT UP !!??	5	2024-02-03	positive	0.9001	Google Play
547	1	A massive improvement from the previous app. More modern and actually works	5	2024-02-03	positive	0.4588	Google Play
548	1	"The choice for all" It is interesting app,The old one was time spent to open the app. I am with you BoA.	5	2024-02-03	positive	0.4019	Google Play
549	1	You make the app worse . Asif it is update you make us install it as new then you create us problems	1	2024-02-02	negative	-0.5719	Google Play
550	1	This upper is very slow	5	2024-01-31	neutral	0	Google Play
551	1	the bank you always accepted Bank of Abyssinia worldwide cyber bank of Ethiopia	5	2024-01-28	positive	0.2732	Google Play
552	1	This app is way better than both Apollo and the old mobile banking app. It's super easy to use and loads really fast. If you already have boa mobile banking before, activating it is a piece of cake. Great job on making such an awesome app keep it up !	5	2024-01-27	positive	0.9595	Google Play
553	1	It is really great to see you have solved some of the problems with the previous version. Thank you for taking time to improve.	5	2024-01-24	positive	0.8479	Google Play
554	1	It is not downloading. It stops at 79 % . Why ?	1	2024-01-23	positive	0.1139	Google Play
555	1	This is a much better app from BOA, easy to activate with ATM credit info, that helps someone like myself who already forgots previous PIN No or IB password. Apps runs fast unlike the previous versions. I hope you don't ruin it with unnecessary update. Please notify customers to use this app through their SMS.	5	2024-01-18	positive	0.9557	Google Play
556	1	The new version is really nice. Keep it up	4	2024-01-18	positive	0.4754	Google Play
557	1	Like I said before, the previous version was horrendous! I'm glad that you took time and decided to develop this awesome app. Well done!	5	2024-01-18	positive	0.8504	Google Play
558	1	? Apollo I'm more 15years customers in your bank but due your Application i decide to shift for other bank like CBE OR TELEBIRR PLEASE FIX THE SPEED	1	2024-01-18	positive	0.8074	Google Play
559	1	You've improved from the previous one! Also try to add dark mode.	5	2024-01-17	positive	0.5255	Google Play
560	1	The worst app. Can't even login to my device. Phone : Pexel7a, version : android 13.	1	2024-01-16	negative	-0.6249	Google Play
561	1	I think this app is fraudulent. It is not real	1	2024-01-15	negative	-0.4939	Google Play
562	1	This new version of the app is really great. Loved it!	5	2024-01-15	positive	0.8709	Google Play
563	1	Best applicationThank you ! Abyssinia bank.	5	2024-01-12	positive	0.6696	Google Play
564	1	Absolutely it's fantastic apps this New apps it's fast and good apps	5	2024-01-11	positive	0.7769	Google Play
565	1	The best app next to Tele birr in ethiopia	5	2024-01-10	positive	0.6369	Google Play
566	2	The app makes our life easier. Thank you CBE!	5	2025-11-27	positive	0.68	Google Play
567	2	the most advanced app. but how to stay safe?	5	2025-11-27	positive	0.6701	Google Play
568	2	it suddenly asked me to enter the verification key I received. and it (*get your verification key from the nearest CBE Branch*) Now I'm in Australia, what do you expect me to do???! There is no nearest or furthermost cbe Branch!! SO FRUSTRATING! How can I manage my bank account now????	1	2025-11-25	negative	-0.8746	Google Play
569	2	very good banking service and fast service	5	2025-11-24	positive	0.4927	Google Play
570	2	thanks blc this app help me to use all time	5	2025-11-24	positive	0.6808	Google Play
571	2	why we can't send money to other people telebirr wallets??	1	2025-11-24	neutral	0	Google Play
572	2	you are the reason why i got ye chogara himem	1	2025-11-22	neutral	0	Google Play
573	2	it is so smart app i recommend it for everyone	5	2025-11-22	positive	0.7395	Google Play
574	2	mid application it's so annoying	3	2025-11-20	negative	-0.541	Google Play
575	2	I used morethan one year	4	2025-11-20	neutral	0	Google Play
576	2	no word can explane about this app it is nice	5	2025-11-20	positive	0.1531	Google Play
577	2	It's great app,I love this app	5	2025-11-20	positive	0.8519	Google Play
578	2	not allowing to transfer and showing current statement updates.	1	2025-11-19	neutral	0	Google Play
579	2	fast and convenient app, thanks for your dedication as a bank to provide good options to your cuatomers.	1	2025-11-19	positive	0.7003	Google Play
580	2	My most optional bank	5	2025-11-17	neutral	0	Google Play
581	2	Seriously, whats going on with this app? The "Pay to Beneficiary" option is completely disabled for Android users, yet iOS users get full access without restrictions. Why are Android users being treated like second class customers? Its the same app, the same service, but clearly not the same experience. This kind of platform bias is unacceptable, either give everyone the same features or be transparent about why youre limiting functionality. Right now, it just feels unfair and frustrating.	1	2025-11-15	negative	-0.8466	Google Play
582	2	Nice and very useful app i like it!	5	2025-11-13	positive	0.8422	Google Play
583	2	sync problem may 22 2025 but the date stack on may 8 2025 help pls	5	2025-11-12	positive	0.4854	Google Play
584	2	I am not able to transfer. The app is not responding	1	2025-11-11	neutral	0	Google Play
585	2	the app constantly glitches and won't stop loading despite having a decent connection and a cleared cache. telebirr is way better	1	2025-11-10	positive	0.6355	Google Play
586	2	I can't access it properly I think it needs update	1	2025-11-10	neutral	0	Google Play
587	2	your statement is not used as wanted	1	2025-11-10	neutral	0	Google Play
588	2	this is absolute trash why because it's not Woking most time the servers are down even though I'm using 4g data Internet they steal not working they use to work with out even data package now it's trash can't even send money	1	2025-11-09	negative	-0.4939	Google Play
589	2	the app is not functional this week.	4	2025-11-08	neutral	0	Google Play
590	2	Numbers 2 and 3 don't write during pin verification.	5	2025-11-05	neutral	0	Google Play
591	2	once it is uninstalled, you need to visit a nearby bank. you go there and they ask you to have a new sim card which hasn't been used before. so you should buy a new sim card and you go back to them with a new sim card, when you reach there service provider says authentication pin is not arrive, the system is not working come back tomorrow.	1	2025-11-05	neutral	0.0258	Google Play
592	2	this app is not working on my phone	5	2025-11-03	neutral	0	Google Play
593	2	CBE needs to show transaction fees before the transaction is confirmed and not after. This is a big issue as fees are no longer insignificant.	3	2025-11-03	negative	-0.5574	Google Play
594	2	After the recent updates, I am unable to download a receipt. I can't see the names of account holders I've previously transacted with. Very important. Please fix it asap.	1	2025-11-03	positive	0.5678	Google Play
595	2	it is a good and clear apps to use	4	2025-10-31	positive	0.6705	Google Play
596	2	I love this app b/c every option in the app very clear and supportive.	5	2025-10-30	positive	0.861	Google Play
597	2	the app is good but their is no dark mode you have to add it	3	2025-10-29	negative	-0.2144	Google Play
598	2	good I love it keep it up but if we had a new update that will be fire Soo good	5	2025-10-27	positive	0.6486	Google Play
599	2	Active and granted system	5	2025-10-27	positive	0.5719	Google Play
600	2	I would like to suggest you improve the time out as it takes the money and doesn't return it back until the next day.	3	2025-10-25	positive	0.6597	Google Play
601	2	The app has a nice design and useful features like balance check and transfers, but its unstable and often fails to connect. It also forces users to turn off Developer Options, which is unnecessary other banking apps work fine without that. Many people use Developer Mode for normal reasons. Please fix performance issues, remove this restriction, and add biometric login for better security and convenience	2	2025-10-19	positive	0.6896	Google Play
602	2	it says "ti is work any more in your device" what can i do??	1	2025-10-18	neutral	0	Google Play
603	2	it's not work correctly when it's needed sometimes, but it works sometimes though	2	2025-10-16	neutral	0	Google Play
604	2	its easy to use and more secured than the previous one. i love it and appreciate commercial bank of ethiopia for every time update.	5	2025-10-16	positive	0.9152	Google Play
605	2	Suddenly the cbe application I was using stopped working and called callcenter, I was told it's because it expired and I should vist any branch to fix it. So I went to CBE Silassie branch.After filling a form they gave me, I sat down and waited until they finish fixing 2 customer's case who arrived before me. But then when it was my turn ppl who came after me with same mobile banking and even Atm card cases were finishing up and leaving I had to get back to my work so I left.with no service.why?	1	2025-10-16	negative	-0.5672	Google Play
606	2	This app dash board is disturbing me. it is not showing me traxation and my balance while displaying others option on dashboard. I think it is a risk full app	1	2025-10-15	negative	-0.6597	Google Play
607	2	providing very secure service.	5	2025-10-12	positive	0.4005	Google Play
819	2	very busy I don't know why... I prefer 889	3	2025-05-22	neutral	0	Google Play
608	2	it doesn't show bank statement and no options to see transactions for the past months.	2	2025-10-12	negative	-0.296	Google Play
609	2	3 stars because I can't see all my transaction history apart from the recents and a refresh button has been removed from the Recents activity. The app should allow clients to view all of the transactions not just recents.	3	2025-10-11	positive	0.2263	Google Play
610	2	exceptional application from others bank	5	2025-10-10	neutral	0	Google Play
611	2	it is very nice. but i have a serious suggestion when you send to other cbe birr customer, it does not show the name of the recipient befor it actually send the money. please improve this	4	2025-10-10	positive	0.8124	Google Play
612	2	it's game changing in financial system	4	2025-10-09	neutral	0	Google Play
613	2	service charge , vat, fee everything here is not yours they wanna take what you have, everything is not fair	1	2025-10-08	negative	-0.2411	Google Play
614	2	why removing screenshot feature why?	2	2025-10-08	neutral	0	Google Play
615	2	very good application! thank you all who participate!	5	2025-10-08	positive	0.7608	Google Play
616	2	application bank commercial Ethiopia I am very happy to be able to appear in a great job on a pleasant job	5	2025-10-08	positive	0.908	Google Play
617	2	I am trying to access this app on my Android phone, but sometimes doesn't work. so kindly try to improve it.	3	2025-10-07	positive	0.8891	Google Play
618	2	what an amazing app. you know how much it simplify life. Thanks cbe. I proud of you.	5	2025-10-07	positive	0.8689	Google Play
619	2	Our Commercial Bank of Ethiopia is Good !	5	2025-10-06	positive	0.4926	Google Play
620	2	terrible when showing history of transaction it shows in disorganised way	3	2025-10-05	negative	-0.4767	Google Play
621	2	lately I am facing a problem with the app ,and the problem is when log in and inter my pin it doesn't work at all and says 'can't sync' why does it say that I was working fine a few day ago and also it says when I enter my pin 'change your pin to 6 digit pin and it doesn't allow me to change it please solve what is the problem with the app ?	2	2025-10-04	negative	-0.5948	Google Play
622	2	excellent app with lots of features	5	2025-10-04	positive	0.5719	Google Play
623	2	cbe the best bank app	4	2025-10-03	positive	0.6369	Google Play
624	2	This App CBE bank it's Simple and Smart I Like it.	5	2025-10-03	positive	0.6369	Google Play
625	2	its Best app But i hate the Repeatedly update request	5	2025-10-02	negative	-0.5346	Google Play
626	2	it was good since it become a robber the vat ,tax,service charge,unbelievable charge to send to other bank, monthly charge,etc i hope one international bank comes and we all leave this bank. enough is enough	1	2025-10-02	positive	0.25	Google Play
627	2	screen shoot always not allowed why?	5	2025-10-02	negative	-0.34	Google Play
628	2	it is very good banking web but its network is sometimes busy i hope they willfix the problem	4	2025-09-30	positive	0.3392	Google Play
629	2	you can't get your own transaction history	1	2025-09-29	neutral	0	Google Play
630	2	All most Good, but need improvement	5	2025-09-27	positive	0.7267	Google Play
631	2	Great application for me,So I would like to rate with Solid 5 star.That It works well overall. So hello everyone enjoy the apps	5	2025-09-27	positive	0.9147	Google Play
632	2	poor app all of you guys delete CBE and download BOA	1	2025-09-27	negative	-0.4767	Google Play
633	2	Most of the time when I try to open the app, it does not load. The circle keeps spinning as if it is trying to open, and get a message saying " 2 attempts left for offline login". This seems to mean that the app cannot connect to the internet, even though I have a stable internet connection, and all other stuff work properly.	2	2025-09-24	positive	0.1779	Google Play
634	2	I am using CBE app very fantastic.	5	2025-09-24	positive	0.5984	Google Play
635	2	this is very useful and consistent app	5	2025-09-23	positive	0.4927	Google Play
636	2	this application provides timely service in a good, fast and reliable manner.	5	2025-09-23	positive	0.4404	Google Play
637	2	it will be more better if the app have the feature receipt verifying from QR CODE SCREENSHOT IMAGES FROM gallery ... currently IT WORKS ONLY FROM DIRECT CAMERA CAPTURING	4	2025-09-23	positive	0.4927	Google Play
638	2	From the UX perspective it can be better, it's old and it's not obvious where you can find some things	3	2025-09-22	positive	0.4404	Google Play
639	2	It is amazing app but it is more better if it is possible to transfer from account to other telebirr	5	2025-09-22	positive	0.771	Google Play
640	2	The app was great while it was active. However, after the app did an update, I lost connection with a message "Network Error". Please try to fix it as there are many clients of CBE using this app globally from abroad countries.	3	2025-09-21	positive	0.7783	Google Play
641	2	the best of all mobile banking in Ethiopia works perfectly fine	5	2025-09-21	positive	0.8807	Google Play
642	2	some time when make transfer from Mobile account to other cbebirr wallet no show customer name so please check it......thanks my cbe.. cbebirr application very nice application wallet	5	2025-09-20	positive	0.5973	Google Play
643	2	this app is very useful but sometimes when you want to see specific transactions it didn't work so that way i gave 3	3	2025-09-20	positive	0.3708	Google Play
644	2	why i must visit the branch i opened my account to activate the mobile banking services? if it a connected network it maybe done from any branch.	1	2025-09-20	neutral	0	Google Play
645	2	The App is very good in its interface and user friendly. But it could be a pro app had it had additional feature that let us run multiple accounts on a single phone with an option of "additional" account!	3	2025-09-19	positive	0.5406	Google Play
646	2	The app is user friendly. But i want some amendment or include option of sending money to other tele birr like other cbe birr.	4	2025-09-18	positive	0.7003	Google Play
647	2	Doesn't have option to generate statement for transactions	3	2025-09-18	neutral	0	Google Play
648	2	it's best app to use recently and upgraded day to day for internationalization	4	2025-09-16	positive	0.6369	Google Play
649	2	Easy to use and not Complicated	5	2025-09-15	positive	0.4404	Google Play
651	2	WHAT A USELESS APP! Transfers, wallet payments, other banks nothing works. Updated, restarted, cleared cache, reinstalled still useless. Crashed and forced me to visit a branch just to log in 3 times. One of the biggest banks in the country cant fix issues a junior developer could solve. Completely unreliable. Big bank , Zero functionality!	1	2025-09-13	negative	-0.8279	Google Play
652	2	after apdate the app doesn't work any thing else it said enable to connects	1	2025-09-12	neutral	0	Google Play
653	2	best MB application in Ethiopia financial sector.	5	2025-09-11	positive	0.6369	Google Play
654	2	am tired why I have to update every 5 day	1	2025-09-11	negative	-0.4404	Google Play
655	2	It is well organized.	5	2025-09-08	positive	0.2732	Google Play
656	2	Can't see the nearest Branch or ATM available	2	2025-09-08	neutral	0	Google Play
657	2	the app does not open	1	2025-09-07	neutral	0	Google Play
658	2	Amazing, Delightful and Seamless Mobile Banking Application, I have ever Experienced!! Indeed, I feel Great Proud to be part of your Stakeholder! My First Choice Bank, Commercial Bank of Ethiopia, The Pioneer and Leading in Digital Banking Services in Ethiopia! Five stars are little to you! Thank you so much	5	2025-09-06	positive	0.9596	Google Play
659	2	it's the best money transfer app ever	5	2025-09-06	positive	0.6369	Google Play
660	2	It is good app and really user friendly , but it not possible to start service after the app is uninstalled or device phone is changed. So please make it easy for us, after once you set us the requirements in your office we should have to use it only by install and launch it. We do not have to visit the near by branch office every time for such silly businesses but important things. in addition to that why is that for hidding senders name or account number How can I know who tranfers to me???	4	2025-09-05	positive	0.9296	Google Play
661	2	unfair cost of transportations... what a shame!!!	1	2025-09-04	negative	-0.795	Google Play
662	2	I think it is a good app to use easily. However, I have one more comment: the app does not automatically sync or update the balance in real time. Please review this issue. For example, when someone transfers money, the receiver's app does not sync automatically. It requires the user to manually initiate an update to see the current balance.	4	2025-09-04	positive	0.765	Google Play
663	2	WAW!!! I AM PROUD!!! MY STRONG BANK WORKS AT BEST EVEN IN A REMOTE LOCATION HERE IN MALABO (ECUATORIAL GUINEA). MEWOLID MUBARAK CBE!!!	5	2025-09-04	positive	0.9147	Google Play
664	2	My account is not working	4	2025-09-03	neutral	0	Google Play
665	2	The recent update is not optimized fir latest version of android	2	2025-09-02	negative	-0.357	Google Play
666	2	the app say it is not compatible with ur phone can u fix it it is not updating.	1	2025-08-30	neutral	0	Google Play
667	2	I would like to give you some feedback on Current update, its very nice and easy to use but in some button there is still not improved For example while iwant to check my recent Txn it not well sequenced and arranged or some txn may not appear ... becouse of this i see many of users of this app discomferted maily merchants and those make High txn daily. improve and miximize the txn shown to 300 up to 500. make Searchable Recent txn button! All in all the bank i Relly on! CBE my bank !	5	2025-08-29	positive	0.619	Google Play
668	2	essy to use ,has great interface and user-friendly g	5	2025-08-29	positive	0.6249	Google Play
669	2	I found it very much friendly	5	2025-08-29	positive	0.539	Google Play
670	2	Very useful app, while we use CBE.	5	2025-08-28	positive	0.4927	Google Play
671	2	In your next update can you come with night mode future	5	2025-08-27	neutral	0	Google Play
672	2	Truly, super competitive when compared to a well known app nowadays functioning broadly by simplest features and means namely known as Telebirr super app, Thus, CBE is my top ultimate choice that I prefer over the other bank due to its beautiful power of lead as a result I could recommend CBE to others because of its service provision via ethical principles and practice for customers satisfaction with existence of constraints and challenges face from burglary and froudalent hacker. Thank you !	5	2025-08-27	positive	0.9834	Google Play
673	2	mayreba app you its better if you use other banks	1	2025-08-27	positive	0.4404	Google Play
674	2	Not Prefect Transfer To Other Bank The Mony Not Deliverd Imidetliy Take Three Or Five Days	1	2025-08-27	neutral	0	Google Play
675	2	let us know before you shut down the app	4	2025-08-27	neutral	0	Google Play
676	2	A great update in the Mobile Banking Application. Thanks for the System and customization department	5	2025-08-26	positive	0.7906	Google Play
677	2	Still I have not face critical problems sometimes delay to open	4	2025-08-26	positive	0.2311	Google Play
678	2	The connection between bank and the app is lag relationship this must be corrected.	4	2025-08-25	negative	-0.34	Google Play
679	2	why does it say change pin to 6 digits is that right?	4	2025-08-24	neutral	0	Google Play
680	2	One of the worst mobile banking apps in Ethiopia. You can't access your txn record for more than 2 weeks.	1	2025-08-24	negative	-0.6249	Google Play
681	2	The app has some issues I updated recently and now I am not able to send funds to my telebirr wallet, also we need to have a place we save our contacts where we usually send money to, after update I keep loosing all the important accounts.	4	2025-08-23	positive	0.6124	Google Play
682	2	best app and easy to use	5	2025-08-23	positive	0.7964	Google Play
683	2	doesn't work unless with data doesn't refresh fast other wise functions ok but after the update transferring to telebirr is not working	2	2025-08-23	positive	0.3919	Google Play
684	2	List of transactions can't load over months and years..	1	2025-08-23	neutral	0	Google Play
685	2	transferring money to telebirr is not working	1	2025-08-23	neutral	0	Google Play
686	2	I don't Like this app and there service fee is highl	5	2025-08-23	negative	-0.2755	Google Play
687	2	this application do not show over all transaction history	3	2025-08-23	neutral	0	Google Play
688	2	this app is very nice but statment history is very shiort atlist add 15 days	4	2025-08-23	positive	0.2609	Google Play
732	2	they been freezing a transfered money till the time they chose chose it to be delivered bruh	1	2025-07-30	negative	-0.1027	Google Play
689	2	This app stooped working after i updated it. It says change password and i did, but it doesn't open with the new password. I don't like it.	1	2025-08-23	negative	-0.395	Google Play
690	2	best and secured application	5	2025-08-23	positive	0.7845	Google Play
691	2	This application is excellent .	5	2025-08-22	positive	0.5719	Google Play
692	2	The new update is very bugged. can't view the names of account holders I previously had transactions with, and more recently, its almost impossible to load money to telebirr, always says unable to connect...please fix asap	1	2025-08-22	neutral	0	Google Play
693	2	I love this app. really, but with some downsides too. Screenshot is mandatory after every transaction as to me, I need screenshots not downloaded recipient. It would be even better if transaction history is available via this app for months that we can access directly or via calender ways. Thanks.	4	2025-08-22	positive	0.8945	Google Play
694	2	good and always try to make new updats	5	2025-08-22	positive	0.4404	Google Play
695	2	I use the Commercial Bank of Ethiopia mobile app, and its fantastic! The interface is user-friendly, making it easy to check balances and transfer money. I love the bill payment feature, and the security measures give me peace of mind. Overall, its a reliable app that has simplified my banking experience. Highly recommend!	5	2025-08-22	positive	0.9637	Google Play
696	2	it's very nice simple and convenient app! but I have only one comment on double verifications after the finger prints. even thought its good for makin' it more secure, Its not neccessary to double verify after the finger print verification. no need to verify by pin again. thank you!	5	2025-08-22	positive	0.8878	Google Play
697	2	why is it every time the app is updated history of previous account numbers keeps missing , WHY??	1	2025-08-21	negative	-0.3736	Google Play
698	2	You guys charge way to much when we transfer money from CBE to Telebirr via this app	3	2025-08-21	neutral	0	Google Play
699	2	yes these app is so good for our saving and marketing system go ETHIOPIA GO!!!	5	2025-08-21	positive	0.8083	Google Play
700	2	best mobile banking App that have seen .	5	2025-08-21	positive	0.6369	Google Play
701	2	It's very helpful apps	5	2025-08-21	positive	0.4754	Google Play
702	2	Every major update means you have to go back to Ethiopia to make the app work. In 2025?	2	2025-08-21	neutral	0	Google Play
703	2	Unable to connect, pls. Improve the system	5	2025-08-20	positive	0.4939	Google Play
704	2	Smart service But, your service charge is too high	5	2025-08-20	positive	0.2144	Google Play
705	2	Would be great if it displays service fees before proceeding with transaction.	4	2025-08-20	positive	0.6249	Google Play
706	2	what nice app i never usedyet	4	2025-08-20	positive	0.4215	Google Play
707	2	this app is pretty good. The recent one was the nicest. however after the update, it restricts me from taking a screenshot. i would be happy if you remove screenshots restriction policy from this app. why I gave it five stars was because of the past performances of this app. keep in mind to remove the screenshot restriction policy from this app. and also it has no self authorizations. once uninstalled it needs extra sim cards and wants to visit nearby banks in person.	5	2025-08-20	positive	0.743	Google Play
708	2	Send money for some account but don't reserved Ball	5	2025-08-20	neutral	0	Google Play
709	2	I recognized thank you	5	2025-08-19	positive	0.3612	Google Play
710	2	the saved account totally removed ..why????????	1	2025-08-19	positive	0.5803	Google Play
711	2	good bank Ethiopian very nic	5	2025-08-18	positive	0.4404	Google Play
712	2	this good app but screenshot must enable	4	2025-08-18	positive	0.2382	Google Play
713	2	The process of updating is not functioning easily. Installing is easy than updating. Screenshot should not be prevented. it is an instant evidence needed for some transactions.	2	2025-08-18	positive	0.1999	Google Play
714	2	this app is the good apps	5	2025-08-17	positive	0.4404	Google Play
715	2	Recent Transaction Evene refresh Transaction Please	2	2025-08-15	positive	0.3182	Google Play
716	2	I don't think it is compatible with the new android version 16 it fails to open. Please update it or find a solution.	1	2025-08-14	positive	0.2023	Google Play
717	2	ohhhh you must upgrade transferring problem. most of time, when transfer from CBE mobile banking to tele birr account, always suspending for 3 to 5 days . please try to fix it	2	2025-08-14	negative	-0.1027	Google Play
718	2	this APK Best for most of people	5	2025-08-13	positive	0.6369	Google Play
719	2	Most of the time either the app or *889# don't work	2	2025-08-12	neutral	0	Google Play
720	2	why this app is logging in while your device is not connected to internet ... is it appropriate ?... and it isnt exposed to hucking or malicious activity?	1	2025-08-12	positive	0.1486	Google Play
721	2	very good app time saving and more accurate	5	2025-08-09	positive	0.4927	Google Play
722	2	i like your app to order ATM card through it, i get it new on your app	5	2025-08-09	positive	0.3612	Google Play
723	2	it is the best transferring AP	5	2025-08-08	positive	0.6369	Google Play
724	2	it's good but add some more please	3	2025-08-08	positive	0.653	Google Play
725	2	very useful to use it from any where in the world !	5	2025-08-07	positive	0.54	Google Play
726	2	it very good but why block the screen shoot	5	2025-08-07	negative	-0.7053	Google Play
727	2	the most disgusting app,	1	2025-08-07	negative	-0.5709	Google Play
728	2	this is the worst app that could exist on the planet, omg it literally crashes every month	1	2025-08-04	negative	-0.6249	Google Play
729	2	the best application for ours	5	2025-08-03	positive	0.6369	Google Play
730	2	our ehiopian bank who teaches us who lends who beulds big infrastractures for any ehiopian countries rigions local areas basic needs for socity that trends to suport echother social participation promots in society welbing coopratives development builds and suports for each private and governmental institutions give advise market analicies so on for targets to develope country to become world class economic leadership capitalist country and to atract big stakeholders in the woreld.	5	2025-08-03	neutral	0	Google Play
733	2	this app is so amazing a use it every time when I make payments	5	2025-07-27	positive	0.7065	Google Play
734	2	I am using this service from abroad, which i have active account in Ethiopia. Anytime I want support family, I easily sent funds to my CBE bank using my abroad debit or visa credit and transfer to their bank. so recommend diaspora to open bank account whenever they going back home. it helps a lot . 1st. They can easily send money from their abroad bank account to their CEB, Awash,Oromia bank whatever. 2nd, They don't need family to withdraw money for them to use it. They have privacy.	5	2025-07-25	positive	0.9512	Google Play
735	2	commercial bank of ethiopia is very helpful for all Ethiopian people that i respect ethio consititution	5	2025-07-25	positive	0.7346	Google Play
736	2	there is many thing u have to fix.	1	2025-07-24	neutral	0	Google Play
737	2	This is the best service, it makes everything easy for you, so why not download this app and if you are satisfied with it, give it five stars, it deserves it.	5	2025-07-24	positive	0.872	Google Play
738	2	good job, but we need to see more transaction history.	4	2025-07-21	positive	0.2382	Google Play
739	2	why i cant screen shoot ?	1	2025-07-20	positive	0.2584	Google Play
740	2	it is good up to now but it needs update today	5	2025-07-18	positive	0.2382	Google Play
741	2	I like this App b/s it's fast, clear, and secured. thank you	5	2025-07-17	positive	0.8519	Google Play
742	2	Although the UI is simple and easy to use. That does not mean anything if information is not consistent throughout the app, and most services are down most of the time. Also, I see that forcing the user to turn off Android Dev Settings to use the app is unnecessary and creates inconvenience for users who want to use their devices for Android development . If you have certain security requirements, you would rather prefer to restrict the minSdk (since recent android releases are secure).	1	2025-07-16	positive	0.5719	Google Play
743	2	difficult to transfer between accounts even settling tax obligations. system error notification more frequent.	1	2025-07-16	negative	-0.6369	Google Play
744	2	ebc app not work or unable to connect server	1	2025-07-15	neutral	0	Google Play
745	2	excellent application, user friendly...nice one	5	2025-07-14	positive	0.5719	Google Play
746	2	why can't I transfer money to telebirr?	4	2025-07-12	neutral	0	Google Play
747	2	CBE Mobile Banking make us our life easier.	5	2025-07-12	positive	0.4215	Google Play
748	2	I can't see my old transaction on this bank app just like other banks mobile apps example abissinya, tele birr, so please update this feature.	1	2025-07-12	positive	0.6696	Google Play
749	2	it's a nice app"and buy to pay then simple for money transaction 10Q CBE.	5	2025-07-11	positive	0.7378	Google Play
750	2	The CBE MB app is best and updated with so many features from time to time,but it is impossible to download statements. if it is possible please add a statement download option for both the app and USSD.	2	2025-07-11	positive	0.7579	Google Play
751	2	option app mobile banking	5	2025-07-09	neutral	0	Google Play
752	2	very poor and even not sho the balance and transaction history	1	2025-07-07	negative	-0.5256	Google Play
753	2	this is very good app but what is bucket override i don't get	4	2025-07-06	positive	0.2724	Google Play
754	2	The best of mobile banking in Ethiopia	5	2025-07-06	positive	0.6369	Google Play
755	2	it's just a basic app, you could do a lot better I couldn't see my 2 months statement even	1	2025-07-06	positive	0.4404	Google Play
756	2	Samsung s05 have no government utility payment options Please fix on the next update	1	2025-07-05	neutral	0.0258	Google Play
757	2	It is developed in a simple way, but what if you add a notebook, like to save some info or other bank account number	4	2025-07-04	positive	0.8402	Google Play
758	2	It is fast and best service. Go a head!	5	2025-07-02	positive	0.6696	Google Play
759	2	This app is not reliable for transferring money to other banks or money transfer apps. It will take your money but not deliver it, and for confirmation, it takes three days to refund.	2	2025-07-02	neutral	0	Google Play
760	2	The worst Bank, system and app ever in Ethiopia.	1	2025-07-02	negative	-0.6249	Google Play
761	2	please update the security policy. we can't take a SCREENSHOTS!	3	2025-07-02	positive	0.6114	Google Play
762	2	It's a great application, but if you could improve it a bit, for example, by making it so that we can register and use it ourselves from the comfort of our own homes without having to go to a bank branch.	3	2025-07-01	positive	0.8641	Google Play
763	2	I really like this application it's easy to use and reliable	5	2025-07-01	positive	0.6901	Google Play
764	2	best application but is not available strong security .	5	2025-07-01	negative	-0.5434	Google Play
765	2	very good thanks for services	1	2025-06-30	positive	0.7485	Google Play
766	2	I like this app bcz of this is very simple and easy to use	5	2025-06-29	positive	0.6872	Google Play
767	2	this application not working properly and payment service and transfer money please fix dear bank developer it's more boring service now	3	2025-06-29	positive	0.3197	Google Play
768	2	for the frist use the app is perfect but soon it begins to change the speed the massages and cost an arm and leg	1	2025-06-29	positive	0.3291	Google Play
769	2	trasaction history needs to be more detailed,	3	2025-06-28	neutral	0	Google Play
770	2	this app has a problem	1	2025-06-26	negative	-0.4019	Google Play
771	2	I'll give 5 stars when the app has the function to see more than just a couple of transactions. Right now, you can not even go back one month and see prior transaction. That is a standard banking function that also CBE should have. Because of that only 1 Start.	1	2025-06-25	neutral	0	Google Play
772	2	The most unreliable banking app i ever used, the transactions are stuck halfway and i can't access my money then when you call the call center they ask that you wait 3-5 business days before they return the money what is the point off having a banking app if the transactions are unreliable and incomplete I'd rate less if i could.	1	2025-06-25	negative	-0.25	Google Play
773	2	for no reason my money is gone because the system keeps tell me failed than I tried to many times were my money is nowhere to be gone when I checked my balance I realise the money is gone	1	2025-06-25	negative	-0.6705	Google Play
774	2	we would appreciate it if the app can allow to take screensshot.	4	2025-06-24	positive	0.5574	Google Play
775	2	Easy to use and clear.	5	2025-06-24	positive	0.6705	Google Play
776	2	Am not able to make screenshot,	1	2025-06-18	neutral	0	Google Play
777	2	setting mini statment app transaction tnx	4	2025-06-17	positive	0.2732	Google Play
778	2	it makes my life easy, and I feel like it deserves a 4-star.	4	2025-06-16	positive	0.6597	Google Play
779	2	It's best app but Please add(included) water bill payment ?	4	2025-06-16	positive	0.6757	Google Play
780	2	the system works even from wherever I am abroad CBE	5	2025-06-15	neutral	0	Google Play
781	2	very nice to use this app	5	2025-06-14	positive	0.4754	Google Play
782	2	Good service and have lightly internet accessed	3	2025-06-14	positive	0.4404	Google Play
783	2	the best mobile banking ever in Ethiopia	5	2025-06-13	positive	0.6369	Google Play
784	2	very good work cbe team well developed	5	2025-06-13	positive	0.6478	Google Play
785	2	Excellent and easy to access and uptodate.	5	2025-06-13	positive	0.765	Google Play
786	2	Best mobile banking app in Ethiopian banking industry. Keep up CBE	5	2025-06-12	positive	0.6369	Google Play
787	2	it's very helpful app in any way in and out of the county of Ethiopia good luck	5	2025-06-12	positive	0.8399	Google Play
788	2	So bad now and hard to use	5	2025-06-09	negative	-0.6361	Google Play
789	2	it is so amazing app. but, it is better to update it to access without any internet fees. just make it to open by free internet service when we open data connection.	5	2025-06-09	positive	0.9049	Google Play
790	2	Very amazing app indeed. I'm enjoying it	5	2025-06-08	positive	0.8173	Google Play
791	2	A great app. It's like carrying a bank in your pocket.	4	2025-06-07	positive	0.765	Google Play
792	2	More than garrantty bank EBC.	4	2025-06-07	neutral	0	Google Play
793	2	really am happy to this app it is Siple to use everything	5	2025-06-07	positive	0.6096	Google Play
794	2	I liked this app. But the User interface is very basic and not attractive at all.	2	2025-06-07	negative	-0.298	Google Play
795	2	"Why dont your ATMs support account-to-account transfers like other countries( Kenya, Nigeria , South africa)"	4	2025-06-06	positive	0.0624	Google Play
796	2	what is this app problem???	1	2025-06-05	negative	-0.5007	Google Play
797	2	the app is proactive and a good connections.	5	2025-06-05	positive	0.6908	Google Play
798	2	I cannot send to cbebirr app. through this app.	3	2025-06-05	neutral	0	Google Play
799	2	everytime you uninstall the app you have to reach them out physically. very oldy! if that's one of security layer, they'd check for fraud attempt via app source directly(source:- app store, play store ... etc) implicitly ! we are in 2025, physical presence for every app install is traditional(traditionally very rare).	1	2025-06-04	positive	0.1739	Google Play
800	2	it was good app but it have some issues like it doesnt give me the right amount that I have in the bank and have some issues in transferring	2	2025-06-04	positive	0.6369	Google Play
801	2	it is like a childish app make it better the worst I have ever seen	1	2025-06-02	negative	-0.2263	Google Play
802	2	It's a problem solver application, go ahead CBE, I love so much.	5	2025-06-02	positive	0.3612	Google Play
803	2	It's good but try to make it facilitate for your client	4	2025-06-02	positive	0.2382	Google Play
804	2	this app has developed in a very good ways but there are some comments I need to make 1- preventing the screenshot likely not good for someone like me coz I need to make screenshot for quicker evidence. 2-it would be good if you make us to access recent transaction histories for 30 days coz we don't have to go to the Bank's in person to see old transactions or add colander category so user can easily access old transactions through colanders.	5	2025-05-31	positive	0.9536	Google Play
805	2	Recently there is big problem when sending to safaricom, telebir, and even to cbebirr wallet could anybody who is responsible fix it, it's very frustrating it's been 5 days and my money hasn't been returned it takes it out of my account but doesn't send it to my mpesa update- they have just corrected it and sent me back the money but still I'm afraid now to send again	2	2025-05-31	negative	-0.3174	Google Play
806	2	it,s good app and time manager	5	2025-05-30	positive	0.4404	Google Play
807	2	lower system everything	3	2025-05-30	negative	-0.296	Google Play
808	2	I was using this app for the last two years with no problems. It stopped working about 3 months ago. when I tried to transfer funds it gives me error "can't do this transaction. inactive account."	4	2025-05-27	negative	-0.8176	Google Play
809	2	i like everything of this app	5	2025-05-27	positive	0.3612	Google Play
810	2	CBE is the best financial application and and very dimple to use. I would like to say thank you so much for the developer of application. I really appreciate this app.	5	2025-05-26	positive	0.9041	Google Play
811	2	this app is absolutely fantastic I love it and I enjoying to it ,let us support this foundation together .	5	2025-05-25	positive	0.9379	Google Play
812	2	The CBE app has been highly unreliable in recent weeks. It frequently fails to work properly on both Ethio Telecom and Safaricom networks, whether using Wi-Fi or mobile data. This week, the system was down entirely for extended periods, making it very difficult to access banking services. The app only functions intermittently, and the lack of consistency is frustrating. I hope the issues are addressed soon, and that any non-technical influences are removed from such essential services.	2	2025-05-25	negative	-0.7841	Google Play
813	2	it is smart app but it has stoped after some period of time on my device with out any reason .	5	2025-05-25	positive	0.2144	Google Play
814	2	amazing app I am used this app for one year	4	2025-05-24	positive	0.5859	Google Play
815	2	why you change default network?	5	2025-05-23	neutral	0	Google Play
816	2	how to I get my money	5	2025-05-23	neutral	0	Google Play
817	2	Very bad, can't even load they need to improve their services.	1	2025-05-22	negative	-0.2247	Google Play
818	2	Very good app, but please make it reliable . it crashes sometimes .	4	2025-05-22	positive	0.6183	Google Play
820	2	Sometimes it has a nasty lag for several hour fix that , the rest is	4	2025-05-22	negative	-0.7184	Google Play
821	2	the most boring Mobil banking application in ethiopia.Please use alternative private banks mobile banking apps	1	2025-05-22	negative	-0.3804	Google Play
822	2	user-friendly apps.because this app is easy.	5	2025-05-22	positive	0.4404	Google Play
823	2	. this app is very nice	5	2025-05-22	positive	0.4754	Google Play
824	2	This app is good, and we are using it well	1	2025-05-21	positive	0.6124	Google Play
825	2	very nice app for android phone	5	2025-05-21	positive	0.4754	Google Play
826	2	easy to use helpful in my life	5	2025-05-21	positive	0.6908	Google Play
827	2	the best mobile banking app	5	2025-05-21	positive	0.6369	Google Play
828	2	this app is very useful app,it saves time,and it is secure	4	2025-05-21	positive	0.6801	Google Play
829	2	it's a good application	5	2025-05-21	positive	0.4404	Google Play
830	2	the screenshot and the reffresh options are so annoying that makes transaction so delaying activity !	2	2025-05-21	negative	-0.5836	Google Play
831	2	it is reliable and easy to use.	5	2025-05-20	positive	0.4404	Google Play
832	2	the most annoying mobile banking app I've ever seen	1	2025-05-20	negative	-0.4576	Google Play
833	2	i can't make Screenshout in this app, please made modification	5	2025-05-20	positive	0.3182	Google Play
834	2	Amazing applicatiom sometimes doesnt work!	5	2025-05-18	positive	0.6239	Google Play
835	2	well satisfied with this beautiful app	5	2025-05-18	positive	0.8316	Google Play
836	2	always disappointing ! especially the iOS one !! some similar local applications are extremely superior to this application!! Really disappointing!	1	2025-05-17	negative	-0.5824	Google Play
837	2	Please kindly ask to update the app and allow us to screenshot, it's convenient and efficient as long as you add security to the access there is no reason to block us from screenshooting our screen.	2	2025-05-14	positive	0.7579	Google Play
838	2	I have using the CBE mobile banking app. and overall i appreciate its Feuteres However i.ve Notticed that when i turn on the Developer options on my divice the App.Stop Functioning prorerly It.Would Be Great If You could look into This issue as l often need to access Developer setting for Otter Application ThankYou For Your attention to This Matter	4	2025-05-13	positive	0.7845	Google Play
839	2	customer service is bad nothing is good about this bank	1	2025-05-13	negative	-0.7101	Google Play
840	2	It is Amazing Mobile Banking App....But why the screenshot of the receipt doesnt work	5	2025-05-13	positive	0.5859	Google Play
841	2	fast and simple easy to use	5	2025-05-12	positive	0.4404	Google Play
842	2	The fastest transferring app I ever had its so reliable	5	2025-05-11	neutral	0	Google Play
843	2	Funds transferred from the same bank do not reflect in the account, even though a confirmation text message was received.	3	2025-05-11	neutral	0	Google Play
844	2	This app don't have self activation only you have to look near cbe branch that's disgusting	1	2025-05-10	negative	-0.5267	Google Play
845	2	hello dearest CBE office personnel make some benefits for those using interest free accounts thanks for your help	5	2025-05-09	positive	0.9524	Google Play
846	2	wow best application ever	5	2025-05-09	positive	0.8402	Google Play
847	2	Am sorry but what does developer mode do to the application ? hack it ? are you sure you are developer or are you stupid, doesnt makes sense,	1	2025-05-08	negative	-0.4871	Google Play
848	2	the pride of Ethiopian bank	5	2025-05-08	positive	0.34	Google Play
849	2	why the app telling me to turn of developer options please fix it.	1	2025-05-07	positive	0.3182	Google Play
850	2	i am very happy . i have small prob. after i transfer i cant put the transfer cashe bil to my dic.	5	2025-05-07	positive	0.6115	Google Play
851	2	All service of Mobile Banking	5	2025-05-06	neutral	0	Google Play
852	2	i miss the old one i couldn't send my mony to other bank..	1	2025-05-06	negative	-0.1531	Google Play
853	2	the app is recently crushing each time you open and try to make transfers...it used to be good. take lessons from the Dashen Super app or ethiotelecom. it is not befitting of your experience and glory. inv3st in making it more friendly and convenient. I am considering leaving CBE for good.	2	2025-05-06	positive	0.9348	Google Play
854	2	good but these week not oky	4	2025-05-06	positive	0.2382	Google Play
855	2	well designed! Fixing bugs & two step verification with biometric... simply it's great!	5	2025-05-06	positive	0.7772	Google Play
856	2	If any developer is reading this please fix the screenshot functionality or at least the download button should work flawlessly without me touching it twenty times.	1	2025-05-05	positive	0.5307	Google Play
857	2	it's a great job.but one more thing, it hasn't been placed for transfer to other banks on face like mobile charge card place	5	2025-05-05	positive	0.765	Google Play
858	2	it's very low quality application	1	2025-05-04	negative	-0.3384	Google Play
859	2	Why stacked sometimes	5	2025-05-03	neutral	0	Google Play
860	2	okay but sometimes busy	1	2025-05-03	positive	0.1154	Google Play
861	2	the worst commercial company that fails to do even the most normal things again and and again.	1	2025-05-03	negative	-0.7845	Google Play
862	2	Very good app. but disappointed by general cessation of system.	5	2025-05-02	negative	-0.4684	Google Play
863	2	Best app but there is some problem I can't send money to telebirr or mpesa so if you can add that it could be use full	4	2025-05-02	negative	-0.2382	Google Play
864	2	its good and simple to use	5	2025-05-02	positive	0.4404	Google Play
865	2	worest app like that bank for security and network access	1	2025-05-02	positive	0.5994	Google Play
866	2	It crashes frequently	4	2025-04-30	neutral	0	Google Play
867	2	I can simply describe this app as "Making all your work easier".	5	2025-04-28	neutral	0	Google Play
868	2	the worst Mobile banking i have ever seen in my life	1	2025-04-26	negative	-0.6249	Google Play
869	2	its good but add more features such like. bank statement showing	5	2025-04-24	positive	0.6804	Google Play
870	2	my first frequent experience of cbe app is critical-time failure such as suspending payment on air for 2-5 days with zero explanation, deducting from sender account without depositing to the receiver act. Another fatal error by the banking company as a whole (not the app itself though) is forced-banking with corporations without consent of employers-users of the corresponding corporations	2	2025-04-21	negative	-0.8797	Google Play
871	2	Actually it is inactive	4	2025-04-19	neutral	0	Google Play
872	2	slow, only one account is used	2	2025-04-19	neutral	0	Google Play
873	2	always CBE is the leading Commercial Bank	5	2025-04-18	neutral	0	Google Play
874	2	nice apps where network is good in connection	5	2025-04-18	positive	0.6908	Google Play
875	2	i can't take screenshot	1	2025-04-18	neutral	0	Google Play
876	2	every update was made the system better and better until the March 19th, 2025 update, not allowing us to screenshot. you guys didn't understand how much it's a really quick and significant thing. You add extra steps to us, which makes the process draw back	3	2025-04-18	positive	0.7823	Google Play
877	2	The best application I have ever seen in Ethiopia banking industry.	5	2025-04-17	positive	0.6369	Google Play
878	2	Absolutely the best app! It works flawlessly, anytime and anywhere.	5	2025-04-17	positive	0.7629	Google Play
879	2	very nice app ever!!!	5	2025-04-16	positive	0.6084	Google Play
880	2	Biometric security for mobile banking is not available	5	2025-04-16	positive	0.34	Google Play
881	2	In the updated version of the app, it takes more time to download the receipt.	3	2025-04-15	neutral	0	Google Play
882	2	very interesting app i am using every day fantastic	5	2025-04-14	positive	0.7645	Google Play
883	2	"This mobile banking app is fast and user-friendly, but the only issue I encountered is that I can't access my bank statement within the app. I kindly request that this feature be added, similar to what is offered by other private bank mobile banking apps.	4	2025-04-13	positive	0.6486	Google Play
884	2	why did this app is not screenshot	5	2025-04-12	neutral	0	Google Play
885	2	less network, specially to make fee for utility purpose	1	2025-04-11	neutral	0	Google Play
886	2	its great app but when updating we can't take screen shot please try to fix it	3	2025-04-10	positive	0.6705	Google Play
887	2	everything is easy thank you cebe	5	2025-04-10	positive	0.6597	Google Play
888	2	but this app says can't sync	5	2025-04-09	neutral	0	Google Play
889	2	work on screen shot system	4	2025-04-08	neutral	0	Google Play
890	2	very very nice aplication	1	2025-04-08	positive	0.5222	Google Play
891	2	wonder full and it is easy to use	5	2025-04-08	positive	0.4404	Google Play
892	2	it is Very Useful app	5	2025-04-07	positive	0.4927	Google Play
893	2	it is good but it doesn't allow screen shot	4	2025-04-06	neutral	-0.0127	Google Play
894	2	You need to copy many things from other bank apps like Amole(Dashen)	2	2025-04-06	positive	0.3612	Google Play
895	2	bring back the screenshot feature.	1	2025-04-05	neutral	0	Google Play
896	2	best app to experience him that to smooth transaction among the customers	1	2025-04-05	positive	0.6369	Google Play
897	2	nice app suitable to use it. the only weak side is it need data connections and hoping will be fixed to offline i gave 4 rate	4	2025-04-05	positive	0.296	Google Play
898	2	Good job to the CBE team on this mobile app! It's designed in a way that's simple and intuitive to navigate, which is great for everyone. It effectively handles the essential banking tasks I need to perform regularly. It's a practical and reliable tool that makes everyday banking much more convenient. Thank you for this useful application.	5	2025-04-04	positive	0.9464	Google Play
899	2	before it was smooth and good. this time after the new update in 2025 i can not make screenshot of my recite. even the downlod button is very delayed in putting my recite in my gallery for simple proof. please fix this i am unable to show proof of payment to my clients. thankyou.	3	2025-04-04	positive	0.4601	Google Play
900	2	this app is very necessary app many people found it	5	2025-04-03	neutral	0	Google Play
901	2	cbe very active Bank I'm using CBE app very very satisfaction	5	2025-04-03	positive	0.7554	Google Play
902	2	It made life alot easier. I cant even imagine having to make all those transactions in person. So this app was crucial for me. Very good app. well done.	5	2025-04-03	positive	0.8104	Google Play
903	2	I don't understand the reason, why I need to disable developer options to access the app, it has no security risks nor does it hinder the app's functionalities. This goes out to the dev, I hope your life is filled with inconveniences.	1	2025-04-02	positive	0.25	Google Play
904	2	very good app and stars faction with work	5	2025-04-02	positive	0.4927	Google Play
905	2	I am more satisfied in this app . More sure you have to secure.	4	2025-04-01	positive	0.7956	Google Play
906	2	very good, but sometimes NUR CBE comes without my consent. even if I choose locked, it appears	4	2025-04-01	neutral	0.0252	Google Play
907	2	I'm lucky to have this thank you CBE.	5	2025-04-01	positive	0.6883	Google Play
908	2	it's need more improvement like Tellbirr.	4	2025-04-01	positive	0.7245	Google Play
909	2	It is veary useful app but screen shout was impossible .solve this problem	5	2025-04-01	negative	-0.2588	Google Play
910	2	Dear cbe this app is not comparable with 21century and pls try to solve it.	1	2025-04-01	positive	0.5719	Google Play
911	2	best transaction method of financial	5	2025-04-01	positive	0.6369	Google Play
912	2	#CBE is Now going to on the right Pathway/track/!! Thank you CBE one step ahead on payment platform app!!	5	2025-04-01	positive	0.5673	Google Play
913	2	Very good application. However, I have one functionality recommendation. What if you let the app transfer money to any telebirr account as for MPESA? By the way, I am not the only one to ask this. Thank you!	4	2025-04-01	positive	0.7476	Google Play
914	2	before update it was able to screenshot while after update I can't able to screenshot the transfere details	4	2025-04-01	neutral	0	Google Play
915	2	it is good app. But you have integrate cbe with cbe birr. to allow cardless withdrawal directly from our accout!	4	2025-03-31	positive	0.5778	Google Play
916	2	the app is very good, but why screenshots is impossible?	5	2025-03-31	positive	0.2724	Google Play
917	2	easy to use and user friendly	5	2025-03-31	positive	0.7269	Google Play
918	2	This application fast, secure and more convenient. Thanks CBE	5	2025-03-31	positive	0.6786	Google Play
919	2	Why didn't you display cash transactions and bank statement in the mobile banking app?	4	2025-03-31	neutral	0	Google Play
920	2	Ever and never seen this kind of app I proud my CBE	5	2025-03-31	positive	0.4767	Google Play
921	2	very good and safe for me!	5	2025-03-31	positive	0.7683	Google Play
922	2	very good, but sometimes....	4	2025-03-31	positive	0.2724	Google Play
923	2	Why not allowed to pay for fuel?	4	2025-03-31	positive	0.0762	Google Play
924	2	nice app and fast money transfer	5	2025-03-31	positive	0.4215	Google Play
925	2	Recently app keeps closing and the notification after says this app has a bug. Can you make an update please	4	2025-03-31	positive	0.3182	Google Play
926	2	there is some issue the process it delay	3	2025-03-31	negative	-0.3182	Google Play
927	2	what an amazing application in Ethiopian Banking industry which is very interested one!	5	2025-03-31	positive	0.7955	Google Play
928	2	It is very excellent anddynamic plus user friend all in one bank apps of the era. I loved it.	5	2025-03-30	positive	0.902	Google Play
929	2	am happy thank you CBE	5	2025-03-30	positive	0.7351	Google Play
930	2	The history sometimes misses transactions, tranfer to cbe birr debited but not really transferred, We need to really cop up with the world for real. The hacks and security problems, invest on and solve them.	3	2025-03-30	positive	0.0772	Google Play
931	2	Good apps ...But fix the screenshot its not easy like before ......	5	2025-03-29	negative	-0.1571	Google Play
932	2	I am not exaggerating when I say that this application is one of the biggest players in the banking industry. It has simplified a lot of things for the user, even if the bank is in his pocket. But my opinion is (1), when we transfer money, there is a word limit on the (Note) at the end. Why can't we write our reason briefly? I don't understand why it is limited. On the other hand, there is no limit on the bank. Could you explain this? (2), when we pay for water, why is the code not mentioned	5	2025-03-29	negative	-0.1408	Google Play
933	2	in this update why screenshoot is disabled now it's not working	1	2025-03-28	neutral	0	Google Play
934	2	realy I donot seen like this application ! fast ,safe ande confortable	5	2025-03-28	positive	0.69	Google Play
935	2	Excellent but needed upgrading!	5	2025-03-28	positive	0.3903	Google Play
936	2	goods app!! pleace update this apps??	4	2025-03-28	neutral	0	Google Play
937	2	The latest update prevents taking screenshots, which is really annoying! please allow us to take screenshots! we need it for evidence (particularly, in case of transfer failure!).	1	2025-03-27	positive	0.4451	Google Play
938	2	Fantastic app! I appreciate it very much	5	2025-03-27	positive	0.7644	Google Play
939	2	Doesn't work properly. It crashes some many times. commercial bank of Ethiopia not only the application but also sending money to own CBE birr doesn't get your money in your bank account. forcefully you must wait 3-5 days to get your money back to your account. walk up CBE the world is going to decentralized finance.	1	2025-03-26	neutral	0	Google Play
940	2	It crashes multiple times everytime you launch it. Fix it. Edit: crash fixed but screenshots has been disabled. I don't know who thought this was a good idea.	1	2025-03-26	positive	0.4588	Google Play
941	2	why why u remove screen shoot	2	2025-03-26	negative	-0.34	Google Play
942	2	I fails mid transaction, No screenshot, download don't work, link shared not working bring back the old app this is usless	1	2025-03-26	negative	-0.7215	Google Play
943	2	problem solver and the best fast app	5	2025-03-25	positive	0.3612	Google Play
944	2	Please bring back the screenshot option. The screenshot download option takes like 15 second appear in gallery and most people don't know about it.	3	2025-03-25	positive	0.5859	Google Play
945	2	very nice and convenient app	5	2025-03-24	positive	0.4754	Google Play
946	2	there are to many bugs app keeps crashi ng and the update file seems to keep getting worse	2	2025-03-24	negative	-0.4767	Google Play
947	2	why did the screen shot stopped ?????	3	2025-03-24	negative	-0.4329	Google Play
948	2	it's a very good application but sometimes it takes a long time to synchronize	4	2025-03-23	positive	0.2724	Google Play
949	2	some times it is difficult to get reciepts for the payment made	1	2025-03-23	negative	-0.3612	Google Play
950	2	best app and update more features *****	5	2025-03-23	positive	0.6369	Google Play
951	2	best app for this vast digital finanical word	5	2025-03-23	positive	0.6369	Google Play
952	2	this app is my favorite application	5	2025-03-23	positive	0.4588	Google Play
953	2	Hooo I love this application	5	2025-03-22	positive	0.6369	Google Play
954	2	The app protects me from screenshot after update. Please make revision on the app.	4	2025-03-22	positive	0.5574	Google Play
955	2	Screenshot or slip not working	2	2025-03-22	neutral	0	Google Play
956	2	I'm sad guys what are you doing? Why did you add the screenshot restriction to the app? You just made it worse it was a great value to us. You need to rethink it. i will change the 1 star rating when you resolve the issue.	1	2025-03-22	positive	0.2869	Google Play
957	2	Thise is helpfull and have good and easy for mobile money usage in ethiopia	5	2025-03-22	positive	0.7003	Google Play
958	2	Old version was very friendly to use. Now we can't see the #Reason The #transaction history (very limited) and now it crash every time it's opened. More over, the last update prevents us from taking #screenshots. Thanks for the developers as they are getting more stupid than ever.	1	2025-03-21	positive	0.0772	Google Play
959	2	What an absolutely terrible update. No screenshots and you still have this stupid restriction on developer options. WHAT ABOUT THOSE OF US WHO ARE ACTUALLY DEVELOPERS!!!!!! At this point telebirr just wins the game 100%. CBE. Do. Better!	1	2025-03-21	negative	-0.7597	Google Play
960	2	In the lasted update you removed the capability to screenshot transactions.	3	2025-03-21	neutral	0	Google Play
961	2	how do you disable screenshots on a banking app you are very unserious people	1	2025-03-21	neutral	0	Google Play
962	2	no screenshot and biometrics on this version wtfk?	3	2025-03-21	negative	-0.296	Google Play
963	2	Not Good, too lame to use	1	2025-03-21	neutral	-0.0191	Google Play
964	2	its good and saving time	5	2025-03-20	positive	0.4404	Google Play
965	2	this new update(Mar 19,2025) is great in fixing bugs, stability and smooth experience I'll give u that but it came with a big shortcoming which is not allowing to take screenshot. I can't screenshot neither my balance nor the transaction or anything within the app, i understand it's for security reasons but please bring that back, allow us to take screenshot we need that. Thanks.	4	2025-03-20	positive	0.93	Google Play
966	2	what went wrong, I couldn't take a screenshot.	3	2025-03-20	negative	-0.4767	Google Play
967	2	App is crushing recently. Please update.	4	2025-03-20	negative	-0.0516	Google Play
968	2	It is good but why screenshot is forbidden	4	2025-03-20	negative	-0.4118	Google Play
969	2	Taking away the screenshot of the receipt is just silly. Worse is tbe download button putting a copy of the screenshot - which you prevented to be taken - in tbe downloads folder where we cant attach directly from Whatsapp. Millions of people use the screenshot as proof of payment / transfer yet you make that harder for everyone? I have every user contacts the developer or manager who made this awful decision.	1	2025-03-20	negative	-0.7506	Google Play
970	2	New update version 5.0.9 keeps crashing it needs maintenance	3	2025-03-19	neutral	0	Google Play
971	2	the update is unneeded	1	2025-03-19	neutral	0	Google Play
972	2	as if the update of march 19 i can't take a screenshot in the app. i can just save it as file and that is so annoying. i used to save all screenshot in my gallery in one folder now with the extra steps added i have to save the file go to file and then screenshot it. the solution is to allow the screenshot to be save in to gallery automatically. i wish you give this review attention and resolve the issue shortly.	2	2025-03-19	positive	0.9502	Google Play
973	2	it is good app but when I make inter bank transaction It can't display The receiver account number and name of receiver and also receiver bank	4	2025-03-19	positive	0.34	Google Play
974	2	It was nice but now it dose not opened the transactions	5	2025-03-18	positive	0.2263	Google Play
975	2	The apps is good to use	5	2025-03-17	positive	0.4404	Google Play
976	2	the app has a bug and it keeps crashing please provide an update and fix the issue thank you....	3	2025-03-17	positive	0.5859	Google Play
977	2	This is my favorite App	5	2025-03-17	positive	0.4588	Google Play
978	2	1.we can't get mobile Token on CBE App or any other online. This is need to improve 2.internet banking is always say authenticate error after some weeks this is need to improve.	4	2025-03-16	positive	0.4767	Google Play
979	2	excellent app for account transaction specially for bussiness customers and a good method to pay bills and different personal payment.	5	2025-03-15	positive	0.7351	Google Play
980	2	The app has brought a new problem. When i open the app, it closes itself then i have to open it again. Please fix this issue if it's your problem	3	2025-03-14	negative	-0.4767	Google Play
981	2	In my view, I can't give any conclusion because it's the starting of an online banking in my country. However, the commercial bank of ethiopia must rebuild this app and also need to make more access to changing the system. Keep continuing ethiopia	5	2025-03-14	neutral	0	Google Play
982	2	Very attractive and user-friendly	5	2025-03-13	positive	0.4927	Google Play
983	2	The app need update it always crash	1	2025-03-13	negative	-0.4019	Google Play
984	2	It is very comfortable and simple to use!!! But whay standing order is not work?	5	2025-03-13	positive	0.4892	Google Play
985	2	One of the best apps I have used ,	5	2025-03-13	positive	0.6369	Google Play
986	2	I am appreciate this app	5	2025-03-13	positive	0.4019	Google Play
987	2	I'm very happy using this app. Thanks to developers.	5	2025-03-12	positive	0.7841	Google Play
988	2	CBE birr app is my best choice.	5	2025-03-12	positive	0.6369	Google Play
989	2	Exceptional/incredible	5	2025-03-12	neutral	0	Google Play
990	2	Unstatisfied with the new update keeps crashing every now and then and even though i haven't reached the max txn per day still refuses to transfer...probably going to change my bank if it's not fixed asap	1	2025-03-10	negative	-0.0762	Google Play
991	2	It is one of the disappointed Bank you don't suppose to include Ethiopian on your name you don't deserve it.	1	2025-03-10	negative	-0.4767	Google Play
992	2	Simple and easy to use	5	2025-03-10	positive	0.4404	Google Play
993	2	I have been using CBE App for long, but recently it has started crashing repeatedly and even my phone is reporting that the app has bugs and tells me to wait the developer to fix these bugs.	1	2025-03-09	neutral	0	Google Play
994	2	Why it asks me Update repeatedly as soon as I download it !!	1	2025-03-09	neutral	0	Google Play
995	2	Commercial Bnk Rate this	5	2025-03-08	neutral	0	Google Play
996	2	It is good for many aspect. If I can get transactions report with time duration(periodically)	3	2025-03-07	positive	0.4404	Google Play
997	2	Best banck in Ethiopia	5	2025-03-06	positive	0.6369	Google Play
998	2	Two step verification update is fake (meaningless). Why because the app gives you an option of to use pin while requesting two step verification step. This updated app is not differ than the previous one in case of security & safegaurding users. The other features of the app are best and easy to use it.	1	2025-03-06	positive	0.7506	Google Play
999	2	I have been a customer of the Commercial Bank of Ethiopia for many years	5	2025-03-03	neutral	0	Google Play
1000	2	We need this app to work properly, and it looks like an outdated	2	2025-03-03	positive	0.3612	Google Play
1001	2	The app crashes too many times. It's a buggy app	1	2025-03-03	neutral	0	Google Play
1002	2	Verry good it is easy to use anything	5	2025-03-01	positive	0.7003	Google Play
1003	2	So slow with Internet	1	2025-03-01	neutral	0	Google Play
1004	2	I phone app is not working	2	2025-03-01	neutral	0	Google Play
1005	2	Good work very important	5	2025-03-01	positive	0.6115	Google Play
1006	2	It is exlent app it is helful	5	2025-02-28	neutral	0	Google Play
1007	2	It's a shame,it can't performe well,you guys can't even fix a bug, It's getting unusable, shame shame shame	1	2025-02-28	negative	-0.8519	Google Play
1008	2	Easy to Use and Effecent System.	5	2025-02-28	positive	0.4404	Google Play
1009	2	It is good but i can not install the app why? And the other one is it is better to show the earliest transactions for instanse before 30 days ago	3	2025-02-27	positive	0.7003	Google Play
1010	2	I have been using the App since it is first released and it has been nice, but the latest Update are very worse the app crashes frequently and drains battery highly.	3	2025-02-27	negative	-0.5704	Google Play
1011	2	Commercial bank and it's mobile banking is very good	5	2025-02-27	positive	0.4927	Google Play
1012	2	Friendly mobile banking application	5	2025-02-27	positive	0.4939	Google Play
1013	2	1 star because I have to visit my bank for new installation of the app and reactivation takes about 45 to 60 minutes with there long queue and system failures. Learn from telebire app and give options to customers to apt out of this ridiculous security feature. Second why is there no customization in the settings for displaying which account I want displayed in the first section rather that slide to my main account every time. You are making us pay a monthly subscription. Bare minimum is not it	1	2025-02-26	negative	-0.698	Google Play
1014	2	Recently it is not working please check it	2	2025-02-26	negative	-0.2411	Google Play
1015	2	It is a user friendly excellent app.	5	2025-02-26	positive	0.7845	Google Play
1016	2	It is Better to use and Save time. I truly appreciate the Bank System.	5	2025-02-25	positive	0.8934	Google Play
1017	2	Simple and secure app	5	2025-02-25	positive	0.34	Google Play
1018	2	Crashing frequently every time I try to log in.. it's so annoying	1	2025-02-25	negative	-0.541	Google Play
1019	2	FIX THE BUG! so frustrating	3	2025-02-25	negative	-0.6166	Google Play
1020	2	My device install up updated all data access all function but can't support transaction i. e first login password works but can't conformation last transaction password	5	2025-02-24	negative	-0.438	Google Play
1021	2	Constantly crashing after new update	1	2025-02-24	neutral	0	Google Play
1022	2	Great UX, simple to use yet has all necessary features.	4	2025-02-24	positive	0.6249	Google Play
1023	2	Why can't we use this app with Developer Mode turned on, when other big international banks apps allow it?	1	2025-02-22	positive	0.2263	Google Play
1024	2	It is Good application	4	2025-02-22	positive	0.4404	Google Play
1025	2	Guys after the last update it's crushing a lot like alot look in to it	3	2025-02-22	neutral	0	Google Play
1026	2	It have a bug it keeps shut down when I open the app. Without any notification. Please fix the bug.	3	2025-02-22	negative	-0.2411	Google Play
1027	2	Very best and fast money transferring app	5	2025-02-22	positive	0.6697	Google Play
1028	2	Why is it so hard to use this app why don't you make it simple like other apps sometimes it doesn't function right	1	2025-02-22	positive	0.1615	Google Play
1029	2	couldnt update the app	1	2025-02-22	neutral	0	Google Play
1030	2	Too much commission and service charges, not fair at all this is stealing	1	2025-02-21	negative	-0.7758	Google Play
1031	2	It is easy and user friendly	5	2025-02-21	positive	0.7269	Google Play
1032	2	When I open the app it turns off keep says (app has a bug ) the app needs update	2	2025-02-21	neutral	0	Google Play
1033	2	Solve unwanted time and the time to losses cbe office	5	2025-02-21	negative	-0.4215	Google Play
1034	2	I faced a big problem with this due to Developer mode problem How can you help me pls?	5	2025-02-21	negative	-0.34	Google Play
1035	2	utilizes too much power & Crashes often	3	2025-02-20	neutral	0	Google Play
1036	2	Most effective so far.	5	2025-02-20	positive	0.5256	Google Play
1037	2	this is the simplest bookeeping system or method. I like it .	5	2025-02-19	positive	0.3612	Google Play
1038	2	These days the App is Crashing immediately after Login please check	5	2025-02-19	positive	0.3182	Google Play
1039	2	I gave it 5 BC this app deserves. Thank you for your services. Appreciated.	5	2025-02-19	positive	0.7003	Google Play
1040	2	It lags before showing the transaction and you have to use the one in the sms message , why doesn't it work on the app it just says loading	1	2025-02-18	negative	-0.3612	Google Play
1041	2	Very amazing application	5	2025-02-18	positive	0.624	Google Play
1042	2	Easy and fantastic to use	5	2025-02-18	positive	0.7579	Google Play
1043	2	The way its menu arranged to use is easy to use.	5	2025-02-17	positive	0.4404	Google Play
1044	2	Its not bad, but there are plenty of errors .	2	2025-02-17	negative	-0.2903	Google Play
1045	2	Waw fantastic Aplication	5	2025-02-16	positive	0.5574	Google Play
1046	2	I am satisfied by this Ap Thank you	5	2025-02-16	positive	0.6486	Google Play
1047	2	Best of the best application for ever	5	2025-02-16	positive	0.8555	Google Play
1048	2	It's very good in reminding the account numbers you have been used, but Need to show recipient history whenever you want to present it.or it has to have a search on options for a spesfic time you want to look for receipts with out going for account details at bank. if you lost your receipt without downloading it and need to look sometime a while you can't get in simple search on the app.	1	2025-02-15	neutral	0.012	Google Play
1134	2	very inconvenience to use. unreliable and needs upgrades!!!	1	2025-01-23	negative	-0.5674	Google Play
1049	2	It crashes a lot; it doesn't work at all sometimes. By far, it is the worst mobile banking app I have ever used.	1	2025-02-15	negative	-0.6249	Google Play
1050	2	a good apps to save my money &withdraw my money to service	5	2025-02-13	positive	0.7269	Google Play
1051	2	It is not functioning most of the time	3	2025-02-13	neutral	0	Google Play
1052	2	It sends unwanted welcome notification every time you login. There is no way that you can disable this.	3	2025-02-13	neutral	-0.0258	Google Play
1053	2	This app now not open what's problem? Please solve it	1	2025-02-13	positive	0.6551	Google Play
1054	2	Developer Option Developer Option :: Android	1	2025-02-12	neutral	0	Google Play
1055	2	It used to be better in the previous. But after the recent update it keeps crashing as soon as it logs in.. it needs to be fixed.	1	2025-02-11	positive	0.2382	Google Play
1056	2	Can't even load our transaction history!!	1	2025-02-11	neutral	0	Google Play
1057	2	Great app, but try to include an access to water bill payment for places other than Adis Ababa & try top the app not to be inactive while developer option setting in Samsung phones is activated	4	2025-02-11	positive	0.5789	Google Play
1058	2	It shut down without warning	1	2025-02-10	positive	0.2584	Google Play
1059	2	Best app of the bank.But,when it needs apdate,customer must be notified in my point of view.Otherwise,customers saying "Mobile banking is not working today" is bad moto.	5	2025-02-10	positive	0.1779	Google Play
1060	2	I use this app all the time on my business but sometimes it is difficult to use in rural areas. because there is not enough network. so what if you prepared it for the public to use offline?	3	2025-02-09	negative	-0.3919	Google Play
1061	2	This app is very interesting and simple to use.	5	2025-02-09	positive	0.4576	Google Play
1062	2	Add customer service please other than calling 951. Why would you have a mobile app but not an online text-based customer service? Why? Disappointing And I will never use the top-up feature again, I have been trying to recharge my safaricom balance but your app would say time out and then credit my account but never recharge my balance, why? Where is my money? Do you expect me to call 951 at midnight?	2	2025-02-08	negative	-0.2982	Google Play
1063	2	Smart and easy to use, i like this app	5	2025-02-08	positive	0.7964	Google Play
1064	2	The best app I love it	5	2025-02-08	positive	0.8555	Google Play
1065	2	Recent transactions doesn't load properly sometimes . And also when transferring to someone sometimes it says failed and but already transferred which might cause to double transfer	1	2025-02-07	negative	-0.2846	Google Play
1066	2	It used to work properly, but not anymore. I used to use the app from abroad; but these days, it kept saying "unable to connect" when I tried to check my balance and do transactions.	1	2025-02-07	neutral	0	Google Play
1067	2	It is a very important application.	5	2025-02-07	positive	0.2716	Google Play
1068	2	It crashes frequently	2	2025-02-07	neutral	0	Google Play
1069	2	To save my time best app to me i like this app tnx cbe !!!	5	2025-02-07	positive	0.9165	Google Play
1070	2	It is a shame not to appreciate the recent system improvements that the Commercial Bank of Ethiopia has been making, and I have no doubt that it will be different from this, InshaAllah. Another thing I would like to comment on is that the current method for transferring money to Telebir can own be sent to the person. So, it is possible to send money directly from the Commercial Bank to other banks. If you make it possible to transfer money directly to anyone, I would be very grateful.thank you	5	2025-02-06	negative	-0.6437	Google Play
1071	2	App keeps on crashing after the latest update. Failures are frequent.	3	2025-02-05	negative	-0.4588	Google Play
1072	2	I don't need to update this app	5	2025-02-05	neutral	0	Google Play
1073	2	After the new update I'm struggling to use this app,it suddenly crush or close automatically pls fix this problem	1	2025-02-05	negative	-0.7003	Google Play
1074	2	Very fast and easy to use	5	2025-02-05	positive	0.4877	Google Play
1075	2	It is best application	5	2025-02-04	positive	0.6369	Google Play
1076	2	This App. Is just a Meaningful Application for our country..	5	2025-02-04	positive	0.3182	Google Play
1077	2	This App Is Best and Fantastic Because easy to use, It has Best security Specially Two Specific Authentication so this security is not path unauthorized person to Our account History. Thankyou CBE For We give this service	5	2025-02-04	positive	0.9623	Google Play
1078	2	The app is crashing several times it's really annoying and sometimes it's says failed during different operations ?????? Please fix it!?	1	2025-02-04	negative	-0.7387	Google Play
1079	2	I have seen lots of great updates right here, especially the 2FA using the biometric security technique, I suggest you work on minimising app crashing due to the accumulation of cache, very little cache crash it.	4	2025-02-03	positive	0.5879	Google Play
1080	2	The Best mobile banking app in Ethiopia. Thanks CBE	5	2025-02-03	positive	0.7964	Google Play
1081	2	Too poor comparing to other countries.	1	2025-02-03	negative	-0.4767	Google Play
1082	2	I updated to the new version a while ago and it keeps crashing, maybe you can fix it.	3	2025-02-02	neutral	0	Google Play
1083	2	After the last two update, I am facing the worst experience with this app.	1	2025-02-02	negative	-0.6249	Google Play
1084	2	Now it's crashing like crazy. It doesn't even open after a recent update.	1	2025-02-01	neutral	0.0258	Google Play
1085	2	This app is so incredible	5	2025-02-01	neutral	0	Google Play
1086	2	Mobail banking is the letest tecnologi	5	2025-02-01	neutral	0	Google Play
1087	2	without any reason it shows white screen and can't make transfers. Then when I went to branch then they reply go to the branch where you open your account.	1	2025-02-01	neutral	0	Google Play
1088	2	It used to be the best bank app in Ethiopia. But now using it is a terrible experience. For every transaction it shows an error message. Making a simple payment requires 5 to 6 trials to complete.	1	2025-01-31	negative	-0.7269	Google Play
1089	2	The worst I had to flight back to fix my app it need you to go back every 4 month not reliable for foreigners	1	2025-01-31	negative	-0.6249	Google Play
1090	2	This should run for worst app of the year	1	2025-01-31	negative	-0.6249	Google Play
1091	2	It's easy to use, but there is some problems sometimes when update the app in the network areas...	4	2025-01-31	negative	-0.3818	Google Play
1092	2	No manage beneficiary for my app	1	2025-01-30	positive	0.2263	Google Play
1093	2	Its good but we need an option of choosing a specific period to get a historique of transactions. For example when i want to check my previous transactions i only get few transactions. Thank you.	2	2025-01-30	positive	0.6858	Google Play
1094	2	Something is wrong with the new update,it keep closing itself and i couldn't made an important transaction.	3	2025-01-30	negative	-0.5707	Google Play
1095	2	The latest updates crushes repeatedly on my Redmi Note 12 pro plus. If you could correct the issue.	1	2025-01-30	negative	-0.4404	Google Play
1096	2	Ive been using the CBE mobile banking app, and overall, I appreciate its features. However, Ive noticed that when I turn on the developer options on my device, the app stops functioning properly. It would be great if you could look into this issue, as I often need to access developer settings for other applications. Thank you for your attention to this matter!	1	2025-01-29	positive	0.8449	Google Play
1097	2	If you are living outside of Ethiopia you better not deposit large money into your mobile account. It can kick you off any time for some small reasons and the only way you can recover is either to go to the bank in person or you need to have access to your phone which is impossible if you are living outside Ethiopia. The only option you will be left with is, you can't use your money. At least it would be better if you can recover your account using email or other verification ...	1	2025-01-29	positive	0.7003	Google Play
1098	2	Updating the app is must everytime they release it even to reload the transaction.	2	2025-01-29	neutral	0	Google Play
1099	2	These app is beast But the new update is great	5	2025-01-29	positive	0.7684	Google Play
1100	2	It's easy and user friendly!	5	2025-01-29	positive	0.75	Google Play
1101	2	It is helpful to save time and energy	5	2025-01-28	positive	0.7964	Google Play
1102	2	DIGITAL LEADER BANK IN ETHIOPIA CBE	5	2025-01-28	neutral	0	Google Play
1103	2	Turning off the developers' options :( This is getting out of hand. We don't need to go through that...	1	2025-01-28	positive	0.0772	Google Play
1104	2	I don't have an idea why our country soft wares needs some beroucracy?? How many peoples knew that about developer options N why is the new app forceing to disable that?? in my side i didn't get the apps as of b4.	1	2025-01-28	neutral	0	Google Play
1105	2	BEST APP EVER,BUT WHEN CBE BE INTEGRATED WITH INTERNATIONAL TRANSFER	5	2025-01-28	positive	0.6369	Google Play
1106	2	Where ever you go no one is like cbe mobile banking.it's absolutely perfect	5	2025-01-28	positive	0.6478	Google Play
1107	2	Does"nt give you a list of beneficieries.	2	2025-01-27	neutral	0	Google Play
1108	2	This app is more helpful and best	5	2025-01-27	positive	0.8204	Google Play
1109	2	I like it more the app cbe thank you !	5	2025-01-27	positive	0.6476	Google Play
1110	2	Alert The device developer Mode is turned on. Please turn off Developer Mode from device settings and try again to use this app OK What is this ?	1	2025-01-27	positive	0.7531	Google Play
1111	2	Correct your order of incoming and outgoing birr	3	2025-01-27	positive	0.296	Google Play
1112	2	The apk doesn't work when the phones developer option is turned on. It always asks me to turn off the developer options to open the apk. Please fix it as it is unnecessary.	4	2025-01-26	positive	0.3182	Google Play
1113	2	Why on earth is CBE telling me to turn off developer mode? As the name clearly states, it's for developers, not for CBE to dictate. There are countless financial apps out there that work just fine without demanding such an unnecessary restriction. If your app cant handle developer mode, thats a you problem. Fix your code instead of disabling features that have absolutely nothing to do with you.	2	2025-01-25	negative	-0.4086	Google Play
1114	2	It keeps asking for an update recursively since the last update. What is going on??	2	2025-01-25	neutral	0	Google Play
1115	2	I donot want to update.	5	2025-01-25	positive	0.0772	Google Play
1116	2	The qr code scans must be backed to see the transfer is done and to use it easily	2	2025-01-25	positive	0.3612	Google Play
1117	2	24 ? This application is too slow & inactive to notify & record transactions, & hence I faced difficulty using it for businesses. would you fix it?	1	2025-01-25	negative	-0.4137	Google Play
1118	2	It is very nice to use	5	2025-01-25	positive	0.4754	Google Play
1119	2	the "developer mode" need to be fixed, it sucks	2	2025-01-25	negative	-0.3612	Google Play
1120	2	The app is simply trash, the only thing that's keeping them afloat is that the woods for the other Ethiopian banks is even trashier	1	2025-01-25	neutral	0	Google Play
1121	2	It very important app	5	2025-01-25	positive	0.2716	Google Play
1122	2	This app after update they ask verification .why they restricted for update?	5	2025-01-24	negative	-0.3818	Google Play
1123	2	thank you very much and we are very very happy with your service	5	2025-01-24	positive	0.7764	Google Play
1124	2	Cbe is the leader bank in Ethiopia by digital payment system	5	2025-01-24	neutral	0	Google Play
1125	2	it's not working properly	1	2025-01-24	neutral	0	Google Play
1126	2	Make an option to send statement by email	1	2025-01-24	neutral	0	Google Play
1127	2	It is simple and very accurate system	1	2025-01-24	neutral	0	Google Play
1128	2	I am happy for using CBE. How ever, i am happy we can not send money to other tele birr by this app. why???	5	2025-01-24	positive	0.8377	Google Play
1129	2	Why developer option is off ? Please remove this feature.	4	2025-01-24	positive	0.3182	Google Play
1130	2	Reminding me to update and pay every month	5	2025-01-23	negative	-0.1027	Google Play
1131	2	After a recent update, this app stopped working with a message " the developer turned off advanced ... etc.	3	2025-01-23	neutral	0.0258	Google Play
1132	2	I am students of accounting and finance when i graduate i wish to do in CBE thanks	5	2025-01-23	positive	0.6808	Google Play
1133	2	wow . what i can say thank you.	5	2025-01-23	positive	0.743	Google Play
1135	2	The worst bank in Ethiopia!	1	2025-01-22	negative	-0.6588	Google Play
1136	2	I have been accessing my CBE from abroad very easily without problems .Good job, guy.	2	2025-01-22	positive	0.4231	Google Play
1137	2	Why force-disable Developer Options in the latest update? I get that it's a security precaution, but it's overkill. Plenty of other financial apps do not require it and it's sometimes necessary for debugging/experimental reasons	1	2025-01-21	positive	0.1779	Google Play
1138	2	The app resets without customer interaction or confirmation, which is concerning. Please improve the user experience to ensure better control and transparency for customers.	5	2025-01-20	positive	0.8658	Google Play
1139	2	It was very convenient and cool to use, but for some reason it hasn't been working for me lately.	1	2025-01-20	positive	0.1979	Google Play
1140	2	Jest i like this app esy and fast	4	2025-01-19	positive	0.3612	Google Play
1141	2	Reliable & Simplified Service	5	2025-01-18	neutral	0	Google Play
1142	2	This application is an unreliable application. Please do not use it. Hackers will enter through the application and take the certificate from CBE.	1	2025-01-18	positive	0.3182	Google Play
1143	2	Please make it active it is delaying in low connection thanks.	5	2025-01-18	positive	0.7003	Google Play
1144	2	Excellent condition security code used	5	2025-01-18	positive	0.7269	Google Play
1145	2	Yeah its very important in our daily life	5	2025-01-17	positive	0.5095	Google Play
1146	2	The new update is seems force enable developer options on setting. And please fix the problem on iphones it only works for few days every time it get maintained at branches	1	2025-01-17	negative	-0.1027	Google Play
1147	2	The great app and banking system	5	2025-01-16	positive	0.6249	Google Play
1148	2	Money transfer options is not giving correct input, and there is no way of knowing whether the money was successfully transferred.	2	2025-01-16	neutral	-0.0093	Google Play
1149	2	i enabled two step verification..when i press Authenticate it says Authentication failed.	5	2025-01-15	negative	-0.5106	Google Play
1150	2	It simplify every step.	5	2025-01-15	neutral	0	Google Play
1151	2	Keep up guys you're always trustful service giver. I appereciated so much.	5	2025-01-14	positive	0.6705	Google Play
1152	2	This app is the worst the current release doesn't work when developers mode is on and the transaction errors make you transfer money twice with errors	1	2025-01-13	negative	-0.836	Google Play
1153	2	It is Nice, but some times details of credited amount not shown from whom sent.	4	2025-01-12	positive	0.631	Google Play
1154	2	I am facing difficulties related to network issues, while I have a good internet connection.	1	2025-01-11	positive	0.1779	Google Play
1155	2	Simple and easy to use	5	2025-01-11	positive	0.4404	Google Play
1156	2	How to make developer mode off	5	2025-01-11	neutral	0	Google Play
1157	2	Alert The device developer Mode is turned on. You can't use this app, Please turn off Developer Mode and try again. OK Why reason?	1	2025-01-11	positive	0.7531	Google Play
1158	2	Good cbe app but it frequently need update , after you update you will go to the Bank officer for verification . But my question is why not verify own self .	2	2025-01-09	positive	0.2382	Google Play
1159	2	First this app was pretty good and well connection while transferring money, but now there's no such a worst mob app ever while transferring money it corrupts due to the network and took the amount of money you were transferring from your account then after seconds interruptions it's shows that the money is transferred (this case happens especially to telebirrr wallet) then after you report the issue to the CBE customer service they refund your money to your CBE account after 3-5 days.	2	2025-01-09	negative	-0.8555	Google Play
1160	2	It nice but some connection limitation	3	2025-01-08	negative	-0.2263	Google Play
1161	2	It is good app but not have statment 1 week 1 month only 2 days and it is not order by time	5	2025-01-08	positive	0.2382	Google Play
1162	2	this app is very good	5	2025-01-08	positive	0.4927	Google Play
1163	2	It fast and satisfied	5	2025-01-08	positive	0.4215	Google Play
1164	2	Best app for the bank	5	2025-01-08	positive	0.6369	Google Play
1165	2	Best app I was but the message updated and it refused to work for me	5	2025-01-07	negative	-0.0516	Google Play
1166	2	Why do i have to close the developer option to use it. After the update it's not even working unless I close the developer option	1	2025-01-07	neutral	0	Google Play
1167	2	Atractive and easy to use	5	2025-01-07	positive	0.4404	Google Play
1168	2	You can not track your transaction history with correct date, time and order	1	2025-01-07	neutral	0	Google Play
1169	2	Keep saying "unable to connect" after a normal phone update. Please update the app to match latest phone "updates"	1	2025-01-07	positive	0.3182	Google Play
1170	2	It's simple and easy to use	1	2025-01-06	positive	0.4404	Google Play
1171	2	Thank you free 2 years	4	2025-01-06	positive	0.7003	Google Play
1172	2	Please Add A dark theme	1	2025-01-06	positive	0.3182	Google Play
1173	2	I don't understand the reason why this app asks me to turn off my developer options whenever I try to log into the app This issue immediately needs to be fixed. Why would I sacrifice my phone's performance to use only this app? It's ridiculous	2	2025-01-06	negative	-0.3612	Google Play
1174	2	I have been using it for a years and it is beautiful in i the time have been using it	1	2025-01-06	positive	0.5994	Google Play
1175	2	Flexible & easy service	4	2025-01-05	positive	0.5859	Google Play
1176	2	Not functional when i need a transactions	1	2025-01-05	neutral	0	Google Play
1177	2	The banks logo, the hidden accounts data are not seen. It is saying it saying unconnected and hence does not sync.	2	2025-01-05	neutral	0	Google Play
1178	2	Is not working for last update	1	2025-01-05	neutral	0	Google Play
1179	2	Why is it asking me for developer option	1	2025-01-05	neutral	0	Google Play
1180	2	We need more update soon! once I updated it, it authomatically stop working	1	2025-01-05	negative	-0.3595	Google Play
1181	2	Very slagish to operate, needs upgraded.	2	2025-01-05	neutral	0	Google Play
1182	2	It gives service great	5	2025-01-04	positive	0.6249	Google Play
1183	2	Why did this application stopped working at the moment	1	2025-01-04	negative	-0.2263	Google Play
1184	2	The worst update seen in the bank industry for mobile banking. If you're unable to make it smooth and reliable at the same time , return it to previous version. It shows that you don't have the best expertise like other banks in the country.	1	2025-01-04	negative	-0.7156	Google Play
1185	2	It's a very good fast service provider but at the moment the system is denying me	5	2025-01-04	negative	-0.2508	Google Play
1186	2	Very good app forever	5	2025-01-03	positive	0.4927	Google Play
1187	2	Thank u for the easy operating service .It made life simple and accurate.Keep it up!!!	4	2025-01-03	positive	0.7412	Google Play
1188	2	This App The Best One	5	2025-01-03	positive	0.6369	Google Play
1189	2	How i can divice developer mood off	5	2025-01-03	neutral	0	Google Play
1190	2	What's your problem with developer option ???	1	2025-01-02	negative	-0.5007	Google Play
1191	2	i can't access this app without turning off the developer option mode	1	2025-01-02	neutral	0	Google Play
1192	2	Always their is a mal function	1	2025-01-02	neutral	0	Google Play
1193	2	It slow and unused app	1	2025-01-02	neutral	0	Google Play
1194	2	Very nice and fast app	5	2025-01-01	positive	0.4754	Google Play
1195	2	Simple bug fix, would help if current exchange rate is displayed on the app.	4	2025-01-01	positive	0.4019	Google Play
1196	2	The not allowing the app while "developer options" is on needs to be fixed! Why the hell is an app telling me what to do with my own OS??? This is an unnecessary fix that needs to be fixed!!!	1	2025-01-01	negative	-0.8078	Google Play
1197	2	The recent update automatically turns the developers option on, and when one starts the app, a message pops up saying the app does not work with the developers option on. So, one has to go to the settings and manually turn the developers option off. Otherwise the app doesn't work.	3	2025-01-01	neutral	0	Google Play
1198	2	When after updating the app it asked me to turn off developer mode how do i do that	4	2025-01-01	neutral	0	Google Play
1199	2	The inconvenience of this app is that it requires developer options to be turned off. This hinders my ability to customize my phone as some of the customization can only be done in the developer options. Also, it didn't have this requirement before, so why now? And please return it how it was because this should not be an issue. Also, when a transaction is completed before it used to allow me to save the image of the completed transaction, now it doesn't, so please fix that also.	1	2025-01-01	positive	0.8176	Google Play
1200	2	Worst update ever. It asked to disable the developer's option which they don't have any authority over. Most useless update ever. I wish I could give it a 0 star if it was possible. Why do you care about my phone's settings? Stupid developers. Should Switch to other banks.	1	2025-01-01	negative	-0.7109	Google Play
1201	2	Wow wonderful app thank you so much.	4	2025-01-01	positive	0.875	Google Play
1202	2	It ask me your developer mode is on and its not working for me???	1	2025-01-01	neutral	0	Google Play
1203	2	The last update is useless!!	1	2024-12-31	negative	-0.5242	Google Play
1204	2	I like you this App..	5	2024-12-31	positive	0.3612	Google Play
1205	2	It is and better than *889#.	5	2024-12-31	positive	0.4404	Google Play
1206	2	The update isn't working	1	2024-12-31	neutral	0	Google Play
1207	2	As an app developer, I rely on Developer Mode to build and test apps, but this app blocks access entirely if it's enabled. This restriction is unnecessary and makes it impossible for developers to use the service. Instead of outright blocking, consider implementing enhanced security measures that don't alienate professionals who need this setting. Please reconsider this policy.	2	2024-12-31	negative	-0.3291	Google Play
1208	2	not convinet in slow Nw	5	2024-12-31	neutral	0	Google Play
1209	2	Weak update ! . b/c it stops when I want to set two step verification on. And it is only applicable if developer options are on. Why ??? Please tell me the reason	1	2024-12-31	negative	-0.4082	Google Play
1210	2	Why I not used on these devices	5	2024-12-30	neutral	0	Google Play
1211	2	Apdates went to dismiss the developer option	2	2024-12-30	neutral	0	Google Play
1212	2	Best Mobile-Banking app! Moreover, I will rate 5 stars as soon as you add "account statement display" menu in it. Hopefully waiting, Thank you in advance!	4	2024-12-30	positive	0.8745	Google Play
1213	2	Even it is a problem to update the app. Fix the issue first	1	2024-12-30	negative	-0.4019	Google Play
1214	2	The review page keeps loading, and even sync is completed. The history page always shows old/unknown transactions. ...... Edited: I guess the loading page means it expires and needs to go to the nearest bank and ask for an extension for another 3 years. Upgrade to 3 stars .	3	2024-12-30	neutral	0	Google Play
1215	2	Simple, Easy platform	5	2024-12-30	positive	0.4404	Google Play
1216	2	Best app from any others app	5	2024-12-29	positive	0.6369	Google Play
1217	2	It's very Simple and useful for customer and also easier from other options of this Bank but its hard sometimes when the net work is bussy and inquiry some add update from the Branch technical stuff when you want this application for critical case the application was inquiring you un wanted update	5	2024-12-29	neutral	-0.0305	Google Play
1218	2	This app is best if you add fingerprint or facial authentication instead of the current one.	5	2024-12-29	positive	0.6369	Google Play
1219	2	I like this application	4	2024-12-29	positive	0.3612	Google Play
1220	2	your service is very very nice	5	2024-12-29	positive	0.5222	Google Play
1221	2	the worst app i have ever seen	1	2024-12-28	negative	-0.6249	Google Play
1222	2	it is best uplication Which i real on	5	2024-12-28	positive	0.6369	Google Play
1223	2	Why we can't make a transfer with foreign banks?	1	2024-12-28	neutral	0	Google Play
1224	2	looks great but it has no option for accessing our transaction history....for some days back ...this makes our work bad	5	2024-12-27	negative	-0.7184	Google Play
1225	2	Everything is good except that it's asking me for update too much even though I updated the app many times and still mentioning that "it is critical update" so pls fix that	4	2024-12-27	positive	0.2944	Google Play
1226	2	You should be boa b/c the app active by self so please arrange now and for activation service l was pay 20 birr this is unfair	1	2024-12-27	positive	0.294	Google Play
1227	2	simplest app. that i have ever used..	5	2024-12-27	neutral	0	Google Play
1228	2	This app is the best, easy and more clear to use including its features to understand so i liked it 100% because the app made the life of customers easy. Thanks cbe and the app.	5	2024-12-27	positive	0.9607	Google Play
1229	2	After the update the system the requirement for minimal is not fair	2	2024-12-26	negative	-0.2411	Google Play
1230	2	its the best and fast	5	2024-12-26	positive	0.6369	Google Play
1231	2	Not used fully amount	1	2024-12-25	neutral	0	Google Play
1232	2	Good commercial bank of ethiopia	5	2024-12-25	positive	0.4404	Google Play
1233	2	I used for long time its best app	5	2024-12-24	positive	0.6369	Google Play
1234	3	its fast and easy to communicate to the app and its available all area keep it up.i will make Happy for this application thank you dashen bank for your effort,commitment and dedication. i appricated your work.	5	2025-11-26	positive	0.8442	Google Play
1235	3	What do you care about my phone's settings? Who are you to tell me what to turn off and on? It is my phone after all. This *develoler option* thing will cost you a lot of users who are willing to leave the bank once and for all. Turn this thing off. 6 you fear this is a security issue fix your side not mine.	1	2025-11-25	positive	0.3736	Google Play
1236	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking keep up the good work, Dashen Bank!..	5	2025-11-19	positive	0.9722	Google Play
1237	3	bill payment options are limited in this app please add ethio telecom bill electric bill etc.. instead of adding nonsense in banking app	1	2025-11-18	negative	-0.3182	Google Play
1238	3	it's a really slow app, I'm not sure what the issue is. Even other bank transfers are not working	2	2025-11-18	negative	-0.2411	Google Play
1239	3	it say's disable developer option, i disabled it but its not working still	1	2025-11-17	neutral	0	Google Play
1240	3	with the super app evry thing i need is just a tap away	5	2025-11-17	positive	0.5994	Google Play
1241	3	I have had an amazing experience with this app;ot os convenient and easy to use	5	2025-11-14	positive	0.7717	Google Play
1242	3	All in One Super App with smooth navigation, transaction and lifestyle services	5	2025-11-14	positive	0.5994	Google Play
1243	3	system failure transfer to others account	2	2025-11-13	negative	-0.5106	Google Play
1244	3	Only the UI/UX is good, but it doesn't function properly. It's a shame that a leading tech bank has such an app. Amole is far better.	1	2025-11-13	positive	0.1655	Google Play
1245	3	excellent app. to use perfectlly to pay,transfer,tele airtime and so on.	5	2025-11-12	positive	0.5719	Google Play
1246	3	wow dashen bank super app	5	2025-11-12	positive	0.8271	Google Play
1247	3	This so-called Super App is a complete disappointment. Its confusing, slow, and full of glitches honestly, it feels like it was designed to test peoples patience, not to help them bank. Calling it super is a joke; its one of the most useless apps Ive ever used.	1	2025-11-11	positive	0.7139	Google Play
1248	3	Best Mobile Banking App in Ethiopia .	5	2025-11-11	positive	0.6369	Google Play
1249	3	very nice app I have ever seen	5	2025-11-10	positive	0.4754	Google Play
1250	3	NASTY BANK . EVEN THE SUPPER APP IS NOT WORKING WELL. WHEN I AM CALLING THEM THEY ARE NOT RESPONSE . PLEASE DON'T USE THIS APP BECAUSE YOU WILL LOSS YOU TIME ;ENERGY AND EVERYTHING . HOPELESS Bank .	1	2025-11-10	negative	-0.9205	Google Play
1251	3	it's good but is not fast	5	2025-11-09	positive	0.2382	Google Play
1252	3	your financial system must improved	4	2025-11-09	positive	0.4767	Google Play
1253	3	your service is too good	5	2025-11-09	positive	0.4404	Google Play
1254	3	easy to use, friendly	5	2025-11-06	positive	0.7269	Google Play
1255	3	not attractive and friendly app. Check Awash, CBE apps	1	2025-11-06	negative	-0.6167	Google Play
1256	3	The Dashen Super App is very impressive. It is fast, easy to use, and provides smooth access to all essential banking services. Money transfer, bill payment, balance check, and other features work efficiently without issues. The design is clean and user-friendly. Great step forward in digital banking keep up the good work, Dashen Bank!	5	2025-11-05	positive	0.9722	Google Play
1257	3	Dashen, always two step ahead.	5	2025-11-05	neutral	0	Google Play
1258	3	Please try to fix the barrier between other banks specially with "Commercial bank of Ethiopia"	3	2025-11-05	positive	0.2023	Google Play
1259	3	It is a wonderful App developed by a local talent. It deserves an appreciation. It will continue to evolve with new exciting features.	5	2025-11-05	positive	0.9186	Google Play
1260	3	i love the app it features are perfect, but it asks to update too many times to activate your need to visit a nearest branch and that takes time. other than that the app is great I like it	5	2025-11-05	positive	0.9306	Google Play
1261	3	Dashen Bank Super App is the latest version of online banking system that is the gift from Dashen bank for us Thanks to Dashen	5	2025-11-04	positive	0.8658	Google Play
1262	3	i rarely leave reviews, but this app truely deserves one.it's efficient ,secure , reliable and makes fanancial tasks effortless.definitely 5 stars for this exceptional app	5	2025-11-04	positive	0.7829	Google Play
1263	3	it has improved very much lately its working more and getting better but yet it is not fully fixed some time at night it doesn't work..i think the problem is it was launched too early.	3	2025-11-04	positive	0.0854	Google Play
1264	3	I just updated my app to the latest version and I couldn't even see my balance, send money or do anything. It says service is unavailable and it will be fixed soon.	5	2025-11-01	neutral	0	Google Play
1386	3	Dashen Bank My Choice	4	2025-06-13	neutral	0	Google Play
1265	3	Before the recent update, this app was great. Now, the home page is cluttered with promotions and banners, which really hurts the experience. I think the app stopped being banking app and started only to promote b/c 95% of the app is only ads, also full of bugs	1	2025-11-01	positive	0.3415	Google Play
1266	3	This might be the worst banking app I've ever used I dont know why kind of bug it is but suddenly the apps stops working it says "Temporarily unavailable" for a simple feature like viewing account balance and in person visit was no help it took them longer than 2 hours to fix it and even after that 2 weeks later the same problem just because of this I'm going to stop using the bank altogether which is a shame because it's a decent bank	1	2025-11-01	negative	-0.8735	Google Play
1267	3	The worst app ever. Extremely unreliable. Such a shame for a big bank.	1	2025-10-31	negative	-0.8158	Google Play
1268	3	app is too slow not opening fast	1	2025-10-31	neutral	0	Google Play
1269	3	it's seems to have some improvements, I don't know what's going on with this app sometimes get collapseed. This is not expected from Dashen bank, which is amongst from famous and greatest banks.	1	2025-10-30	positive	0.7579	Google Play
1270	3	what your emplyees tell as about the app when they came to our store and what actually the app is different	1	2025-10-30	neutral	0	Google Play
1271	3	Dashen Bank Super App is incredibly convenient! Easy to use, fast, and reliable a great app to manage everything in one place.	5	2025-10-29	positive	0.9094	Google Play
1272	3	it is the worst app ever istg	1	2025-10-29	negative	-0.6249	Google Play
1273	3	Dashen Super App is a game-changer with its sleek, user-friendly interface. Lightning-fast responses and seamless navigation make every task a breeze. Love the organized layout and clear features that save time daily. Fantastic workhighly recommended for effortless banking!	5	2025-10-28	positive	0.9617	Google Play
1274	3	The design is clean and modern, and everything works smoothly without bugs. I love how reliable the app is it makes banking so convenient.	5	2025-10-28	negative	-0.17	Google Play
1275	3	A true banking super app! The Dashen Super App combines great design, security, and an impressive range of features. Highly recommended for anyone looking for a complete digital banking experience.	5	2025-10-28	positive	0.9712	Google Play
1276	3	I appreciate that this app allowed me to access multiple services in one centralized place. Thank you, Dashen Bank!	5	2025-10-28	positive	0.6696	Google Play
1277	3	This app makes my day-to-day payments so easy. Everything works perfectly, and it saves me a lot of time.	5	2025-10-28	positive	0.8377	Google Play
1278	3	Its impressive how consistently the app is improving. Ive been using it for months and they have improved a lot in terms of not only beauty but also performance wise.	5	2025-10-28	positive	0.8028	Google Play
1279	3	This app has replaced several others for me. It has everything I need in one place.	5	2025-10-28	neutral	0	Google Play
1280	3	The app has evolved impressively over time. The latest release adds dark and light modes that enhance usability and design. Its intuitive, modern, and clearly built with the user in mind setting a new benchmark for digital banking.	5	2025-10-28	positive	0.6908	Google Play
1281	3	Dashen superapp just keeps improving. The new theme options are beautiful, and the overall experience is faster and smoother than ever	5	2025-10-28	positive	0.7717	Google Play
1282	3	I have been using this app for months and its easy to use and is user friendly thanks Dashen bank.	5	2025-10-28	positive	0.8402	Google Play
1283	3	Finally, banking made simple! Everything I need is in one super app. A true game changer for managing my finances on the go.	5	2025-10-28	positive	0.7901	Google Play
1284	3	Ive been using the the App, and its been working really well for my daily transactions. Good work	5	2025-10-28	positive	0.6478	Google Play
1285	3	I appreciate how secure this app feels. Every transaction comes with confirmation, and I always get alerts immediately.	5	2025-10-28	positive	0.6249	Google Play
1286	3	I love the new dark theme it gives the app modern feel n make it more comfortable to use	5	2025-10-28	positive	0.8313	Google Play
1287	3	This is amazing app, as it name ,truly supper.	5	2025-10-28	positive	0.7717	Google Play
1288	3	This is one of the most user friendly and impressive apps I have encountered in the banking sector	5	2025-10-28	positive	0.7769	Google Play
1289	3	Amazing UI and UX, the dark mode looks absolutely awesome!	5	2025-10-28	positive	0.8585	Google Play
1290	3	The updated design looks amazing. I really appreciate being able to switch between dark and light mode its a small change that makes a big difference!	5	2025-10-28	positive	0.7955	Google Play
1291	3	Astonishing interface with ease of access and complete performance	5	2025-10-28	positive	0.3612	Google Play
1292	3	I rarely leave reviews, but this app truly deserves one. Its efficient, secure, and makes financial tasks effortless. Definitely a 5-star experience	5	2025-10-28	positive	0.9357	Google Play
1293	3	stunning UI with reliable service!	5	2025-10-28	positive	0.4389	Google Play
1294	3	Super Up is the ultimate digital banking app, living up to its name with speed, efficiency, and innovation. Designed for a seamless experience, it offers lightning-fast transactions, top-tier security, and effortless financial management. With Super Up, banking has never been this smooth, smart, and super!	5	2025-10-27	positive	0.969	Google Play
1295	3	The UI is impressive, but adding an ATM withdrawal feature for cardless cash access would enhance functionality. This may require updates to the ATM system as well. Please consider this, dev team.	4	2025-10-22	positive	0.7845	Google Play
1296	3	Dashen SuperApp is the worst app for me because it consistently fails during transfers. When I try to send money, the transaction freezes for extended periodssometimes a full day, and often two or three days or more. Crucially, the funds are neither delivered to the recipient nor immediately refunded to my account, which is incredibly frustrating and makes me feel like I've lost my money. The app urgently needs a technical update to ensure transactions process smoothly and reliably.	1	2025-10-14	negative	-0.8122	Google Play
1297	3	Finish the app development fully before you give the final result. It's is very inconvenient and not that reliable at the moment.	1	2025-10-08	negative	-0.4005	Google Play
1339	3	can't access as will if it's super and can't even access the service when you need it's a big failure	1	2025-08-22	positive	0.1531	Google Play
1298	3	@Shewangizaw L. As a heavy user of the app , the issue you raised around resetting pass pin concerned me and gave it a try and found it to be safe. Basically the app will do two things: verifies one using an otp and then requires an in-person visit to bank's physical branch for final verification after resetting the password. Therefore, safe to use! I wish "i"nformational tip was added around the reset button. Could not attach screenshot.	4	2025-10-06	positive	0.8313	Google Play
1299	3	for dashen bankk it is best app so why your bank onlyu one one app for mobile banking that means superr app	5	2025-10-05	positive	0.6369	Google Play
1300	3	I can't open virtual account.I have been trying it for about 3 days still no resolve.	2	2025-10-04	positive	0.1027	Google Play
1301	3	App is passive when compare to Amole it takes 3-5 seconds to open and i cannot refresh transactions what i did.	1	2025-10-03	positive	0.2023	Google Play
1302	3	It takes gazillion years to open	3	2025-10-02	neutral	0	Google Play
1303	3	this app is outstanding	5	2025-10-01	positive	0.6124	Google Play
1304	3	I really appreciate but we can't use it if don't have balance or data access	2	2025-10-01	positive	0.2492	Google Play
1305	3	Good improvements after the Sep 25, 2025 update.	4	2025-09-29	positive	0.6369	Google Play
1306	3	I have one issue though what if the mobile phone with the sim is stolen and have no pattern or pin. The app allows to reset the pin directly without 2FA like finger print just by sending sms. which is a big gap. It should be addressed I didn't expect but it does and no trust at all.	1	2025-09-28	negative	-0.1543	Google Play
1307	3	Dashen super app is the best all ethiopian banks keep it	5	2025-09-27	positive	0.8442	Google Play
1308	3	App That makes cashless society in our century and Easy to use.	5	2025-09-27	positive	0.4404	Google Play
1309	3	It is an amazing app and all in one	5	2025-09-27	positive	0.5859	Google Play
1310	3	its amazing app, visually stunning	5	2025-09-26	positive	0.7506	Google Play
1311	3	Updates every time , when it's updated, it doesn't work at all.	1	2025-09-26	neutral	0	Google Play
1312	3	the best app from other dashen is unique its fast app ever i had in my life	5	2025-09-26	positive	0.6369	Google Play
1313	3	I love the new user interface	5	2025-09-26	positive	0.6369	Google Play
1314	3	Appreciated, Always one step ahead!	5	2025-09-26	positive	0.5562	Google Play
1315	3	The app stops working whenever there is an update unless you update the app. But it is better if it kept working on and updating should be optional.	3	2025-09-26	positive	0.5499	Google Play
1316	3	This is the first time i have experienced this much cool app out of all the other mobile banking platforms, im genuinely happy to see this kind of app here, tnx	5	2025-09-26	positive	0.7964	Google Play
1317	3	it can't do without data or wifi	1	2025-09-26	neutral	0	Google Play
1318	3	The best UI banking app from all those I used, other Ethiopian banks I used have a really old UI. This is very neat and easy to use. Also so reliable.	5	2025-09-26	positive	0.8923	Google Play
1319	3	What's the problem with this app's that asking for updates on a daily basis?	1	2025-09-25	negative	-0.4019	Google Play
1320	3	Wow, I really loved the new UI/UX! Great job, Dashen Bank! You guys are the best mobile banking in Ethiopia.	5	2025-09-25	positive	0.9576	Google Play
1321	3	one of the best app in Ethiopia .	5	2025-09-24	positive	0.6369	Google Play
1322	3	it is good but some times says duplicate transaction why? and text	5	2025-09-23	positive	0.2382	Google Play
1323	3	The worst app. It needs updating everyday. Ouch	1	2025-09-19	negative	-0.6249	Google Play
1324	3	is not working right now with snmsung galaxy f15, please help me	1	2025-09-14	positive	0.6124	Google Play
1325	3	Your staffs are really hardworking but the app is not like your employees	3	2025-09-12	negative	-0.395	Google Play
1326	3	dashen super app is the best	5	2025-09-10	positive	0.8442	Google Play
1327	3	what happened to dashen bank? this is by far the worst banking app. extremely slow when it works and is out of service all the time	1	2025-09-08	negative	-0.6249	Google Play
1328	3	simple and easy to use	5	2025-09-08	positive	0.4404	Google Play
1329	3	not a great app compared to the others ,It freezes randomly ,Takes a lot to load ,and a lot of errors while sending money ,I stopped using it	1	2025-09-07	negative	-0.7713	Google Play
1330	3	bad specialy at weekends	1	2025-09-07	negative	-0.5423	Google Play
1331	3	I am very disappointed with the Dashin Bank Super App. The app does not allow me to withdraw 50 birr or can't transfer money and even I can't use it to buy airtime. This makes me feel like my 50 birr is no longer my money, but the banks money, since I cannot access or use it freely. According to the National Bank of Ethiopia (NBE), the rule is that 100 birr is not withdrawable, but it can be used to buy airtime or transferred to friends. Dashin Banks restriction goes beyond this rule and unfa	1	2025-09-06	positive	0.7522	Google Play
1332	3	It is good apps but it needs strong network	5	2025-09-06	positive	0.7506	Google Play
1333	3	The app doesn't allow to switch between accounts. Why is it not possible to use two accounts on the same app even if the accounts have been opened at different branch?	2	2025-09-06	negative	-0.1695	Google Play
1334	3	Dashin mobile banking is become worest app like others Ethiopian bank apps. Amole was the best app ever I used. It was so flexible & reliable to use. and the best app user can login with new device without go to bank physically.	1	2025-09-05	positive	0.9245	Google Play
1335	3	The app has potential, but the QR payment feature is disappointing. The scanner doesnt work, and even though theres an option to select a QR code from the gallery, it doesnt function either. This makes paying with QR codes almost impossible. Fixing this would really improve the app.	3	2025-09-04	neutral	-0.0027	Google Play
1336	3	very slow and failed transaction multiple times, previous app was much better!!	2	2025-09-04	negative	-0.3066	Google Play
1337	3	"super Idiot app" 1.it forced me to off many of my phone settings like developers option. 2.Never works fastly. 3.It needs multiple click. 4. Doesn't notify if received money & many many more *** The worst mobile app ever expanded***	1	2025-09-01	negative	-0.6444	Google Play
1338	3	Excellent, and it's truly a super app!	5	2025-08-24	positive	0.8955	Google Play
1340	3	Dashen Super App contains extended selections for customers and can be easily accessible and also friendly to use.	2	2025-08-21	positive	0.8591	Google Play
1341	3	easy to use and the best one	5	2025-08-17	positive	0.7964	Google Play
1342	3	it is totally work of failure. I personally prefer dashen amole instead of this super dull app.	1	2025-08-16	negative	-0.1627	Google Play
1343	3	The worst banking app in Ethiopia. It forces you to change your PIN every three months.	1	2025-08-16	negative	-0.6249	Google Play
1344	3	best but USSD is necessary	5	2025-08-15	positive	0.3818	Google Play
1345	3	one step forward, Ethiopian bank and e commerce industry	5	2025-08-15	neutral	0	Google Play
1346	3	still it's essay for user	4	2025-08-15	neutral	0	Google Play
1347	3	Great app, unfortunately I struggle to use it from outside Ethiopia. It tells me "VPN enabled please disable VPN to continue using the app". And that's happening without any VPN enabled. I think I will need to switch back to CBE because I need access to my bank account globally.	1	2025-08-15	positive	0.4019	Google Play
1348	3	It was easy enough before. but now it won't even open , why? pls help if possible. The email address you provided under the App support also can't be found by Gmail. pls respond.	3	2025-08-14	positive	0.8735	Google Play
1349	3	There are plenty of features missed e. g electricity bill, water bill payments	2	2025-08-14	negative	-0.296	Google Play
1350	3	its a very low quality and slow application, very unreliable in times of need	1	2025-08-13	negative	-0.3384	Google Play
1351	3	very poor and time taking to use	1	2025-08-13	negative	-0.5256	Google Play
1352	3	it is the best app ever i have seen Dashen bank always one step a head!!!!	5	2025-08-13	positive	0.7482	Google Play
1353	3	the new version is so good I like it	5	2025-08-13	positive	0.7593	Google Play
1354	3	good job my dashen super app	5	2025-08-12	positive	0.7783	Google Play
1355	3	its good but he said uptede me	2	2025-08-12	positive	0.2382	Google Play
1356	3	fast and easy to use great App.	5	2025-08-12	positive	0.7906	Google Play
1357	3	Best Performing and Fast Financial app	5	2025-08-12	positive	0.6369	Google Play
1358	3	good but it takes forever to load	3	2025-08-12	positive	0.2382	Google Play
1359	3	It's very good, but there are some things that need to be improved by (speed & receipt view) to be competitive with the companies in the country, i.e.cbe&telebirr.	4	2025-08-12	positive	0.8072	Google Play
1360	3	This is boring Mobile banking app, it is not work properly .so slow!	1	2025-08-11	negative	-0.3802	Google Play
1361	3	improve the app, please. it is not working. It says response timeout	1	2025-08-10	positive	0.6369	Google Play
1362	3	modern perfect app interface with the best banking tools	5	2025-08-09	positive	0.836	Google Play
1363	3	when i tried to open the app it re-downloading something big 3GB 4GB size and after 3 hours late it will open. it's my experience Very worst app it isn't lite app not works in every situation of networks.	1	2025-08-08	negative	-0.659	Google Play
1364	3	slowest banking app ever used	3	2025-08-07	neutral	0	Google Play
1365	3	Dashen Bank super app is the best app	5	2025-08-05	positive	0.8442	Google Play
1366	3	would most likely rate it even less but it does have it's perks. But for the most part the whole app is filled with bugs and it stops being responsive almost everytime. Besides some new features and the new UI design I most definitely prefer the old amole Version. either fix this mess or bring back Amole	2	2025-08-01	positive	0.3668	Google Play
1367	3	sometimes is not working to be honest	1	2025-08-01	positive	0.5106	Google Play
1368	3	Why isn't this app working?	5	2025-07-29	neutral	0	Google Play
1369	3	It stop working most of the time.	2	2025-07-28	negative	-0.296	Google Play
1370	3	i were smothely using the app for the last 5 month but somehow its not working to now so what shall i do it becames like i can open the app even i can't open it if u have solution's pls help me kindly tnx	1	2025-07-28	positive	0.9349	Google Play
1371	3	Simple for usage and well designed, attractive in its visual design, "Always One Step Ahead"	5	2025-07-24	positive	0.6124	Google Play
1372	3	this app is not good and compatible with other Ethiopian bank apps, it is not fast, is stacks sometimes ,even some days it stops working at all.	1	2025-07-23	negative	-0.4599	Google Play
1373	3	Great always one step ahead and most reliable bank	5	2025-07-22	positive	0.6249	Google Play
1374	3	u need to start cash out service	4	2025-07-22	neutral	0	Google Play
1375	3	The app even in its' first phase is too far one step booster that enables a user to perform a seamless Banking service with multi step security features at his/her comfort zone. It really assured that Dashen Bank is living the Logo "ALWAYS ONE STEP AHEAD"	5	2025-07-20	positive	0.7713	Google Play
1376	3	the worst app I have ever seen	1	2025-07-14	negative	-0.6249	Google Play
1377	3	very good compared to Amole!	5	2025-07-13	positive	0.54	Google Play
1378	3	while it's very secure, it is very slower than other mobile banking apps. it is very lazy app!	2	2025-07-12	negative	-0.1007	Google Play
1379	3	Cannot list the number of bugs with this pile of human waste. The absolute worst banking app I have ever used. 50 steps backwards. DO NOT RECOMMEND.	1	2025-07-02	negative	-0.8681	Google Play
1380	3	best app with best bank	5	2025-07-02	positive	0.8555	Google Play
1381	3	worst app ever and by any chance your account is deactivated, you are doomed	1	2025-06-27	negative	-0.8074	Google Play
1382	3	Ethiopian amazing`s Dashen Bank	3	2025-06-25	neutral	0	Google Play
1383	3	It's an unpredictable app, I can't make transactions, and now I can't even get the OTP! So it's going from bad to worse! Thank goodness the Amole Dashen app still exists.	1	2025-06-25	negative	-0.3987	Google Play
1384	3	I would be happy if I got a withdraw system in the application. Otherwise, everything is fine for me	4	2025-06-18	positive	0.6705	Google Play
1385	3	It's an amazing application to use bank transactions in Ethiopia and it's so friendly btw, but need to ck that account link when we lost our mobile it's ver difficult to link up for the next one pls ck	5	2025-06-14	negative	-0.2003	Google Play
1387	3	very simple and user friendly app Thank you Dashen Bank	5	2025-06-12	positive	0.6908	Google Play
1388	3	I like this mobile banking app very much. Overall user interface and navigation is awesome. But it lacks instant response when someone deposit or withdraw money.	2	2025-06-07	positive	0.5106	Google Play
1389	3	Massive upgrade from the Amole app.	5	2025-05-31	neutral	0	Google Play
1390	3	very good for this app	5	2025-05-31	positive	0.4927	Google Play
1391	3	this app better than Amole . but the biometric on new update doesn't work	4	2025-05-31	positive	0.2382	Google Play
1392	3	wow to it saff and this app	5	2025-05-30	positive	0.5859	Google Play
1393	3	useless app ever loading take long	1	2025-05-27	negative	-0.4215	Google Play
1394	3	Game changer app! Dashen Bank Super App is fast, secure, and easy to use. The three-click payment makes sending money super quick, and the QR code payment is perfect for cashless shopping. I also love the biometric login and easy airtime and bill payments. Everything I need is in one place. Dashen Bank has really raised the bar for digital banking in Ethiopia. Highly recommended!	5	2025-05-26	positive	0.979	Google Play
1395	3	Simple, robust features? Yes, please! But the endless loading screen killed the funI couldnt use it for days. Fix the glitch, and Ill yeet a higher rating!	2	2025-05-26	negative	-0.8531	Google Play
1396	3	it is not as good as to the other mobile bank app.	1	2025-05-22	negative	-0.3412	Google Play
1397	3	The best of best is now arrived **Empowering Your Financial Freedom** "Experience seamless banking at your fingertips with Dashen Bank. Empowering your financial freedom, anytime, anywhere!" **Innovation Meets Convenience** "Dashen Bank Mobile Banking: Where innovation meets convenience. **Secure and Reliable** "Bank with confidence	5	2025-05-22	positive	0.9628	Google Play
1398	3	Nothing is changed in the updated version. You have been collecting comments but where is the feed back you improved in this version. superapp is mot functioning today.	4	2025-05-20	positive	0.631	Google Play
1399	3	The best app ever in finance sector	5	2025-05-18	positive	0.6369	Google Play
1400	3	Its good app than other compitators but it confuse when we transfer it needs OTP and PIN most user inter their pin instead of OTP we know the litrecy level of our society so if it is device based i dont know the needs of OTP so please try to fix	3	2025-05-18	positive	0.5554	Google Play
1401	3	dashen bank or dashen super app?	1	2025-05-17	positive	0.5994	Google Play
1402	3	Transferring to other bank accounts is a hastle and inconvenient .Get used to seeing " please try again "	2	2025-05-17	neutral	-0.0258	Google Play
1403	3	Amazing Application...	5	2025-05-16	positive	0.5859	Google Play
1404	3	Dashen bank app is very good, but sometimes it is not working well	5	2025-05-15	neutral	-0.0321	Google Play
1405	3	It grows ethiopian digital banking step ahead.All fetures in one,simple fast and convince.	5	2025-05-14	positive	0.25	Google Play
1406	3	what a helpful app!!!!	5	2025-05-13	positive	0.6083	Google Play
1407	3	To be honest, best banking and lifestyle app in Ethiopia.	5	2025-05-12	positive	0.8176	Google Play
1408	3	A must have, seamless, all in one digital platform "DB Superapp"! Keep living your motto "Always one step ahead"	5	2025-05-12	neutral	0	Google Play
1409	3	Amazing app super easy to use and best design. loved it.	5	2025-05-09	positive	0.9623	Google Play
1410	3	excellent game changer App	5	2025-05-08	positive	0.5719	Google Play
1411	3	I am highly excited by using this application and it is the most favorable as well as preferrable mobile app.	5	2025-05-03	positive	0.8151	Google Play
1412	3	it seems me logging out within minutes	1	2025-05-03	neutral	0	Google Play
1413	3	nice app especially GUI and I have got some error when you send within dashen bank the receipter is not get SMS notification	4	2025-05-03	neutral	0.0258	Google Play
1414	3	yes i want dashen super open	5	2025-05-02	positive	0.7845	Google Play
1415	3	faster than this version	5	2025-05-01	neutral	0	Google Play
1416	3	Best UI mobile banking app, props to design team	5	2025-04-30	positive	0.6369	Google Play
1417	3	dashen super app is secure band very easy	5	2025-04-29	positive	0.8588	Google Play
1418	3	It is very fast and secured mobile banking app! I like this app!	5	2025-04-29	positive	0.7225	Google Play
1419	3	Its slow when i try to see the Recent Transaction and stucked	1	2025-04-28	neutral	0	Google Play
1420	3	why do i have to change a pin number i use my finger print so dummy	1	2025-04-27	positive	0.0772	Google Play
1421	3	It is very slow and it lacks many features to be a super app. High rating is given by their employees, not by the customers.	1	2025-04-25	positive	0.5994	Google Play
1422	3	Smooth and secure experience transfers, bill payments, and tracking expenses are all effortless. The intuitive design makes banking on the go.	5	2025-04-24	positive	0.34	Google Play
1423	3	Incomparably user-friendly and fast app for mobile banking.	5	2025-04-24	neutral	0	Google Play
1424	3	there is nothing super about this app, repeatedly failed transaction and wastes customer valuable time. if you have to do system upgrade do it at a time when there is less traffic demand. your Technical difficulty should not be reflected on customer.	2	2025-04-24	negative	-0.7156	Google Play
1425	3	This super app is a total game-changerfast, reliable, and packed with everything I need in one place. Its seamless and super convenient. Love it!"	5	2025-04-23	positive	0.923	Google Play
1426	3	All in One secure reliable convenient. Digital banking game changer!!	5	2025-04-23	positive	0.4559	Google Play
1427	3	it is incredible product.	5	2025-04-23	neutral	0	Google Play
1428	3	I'm really impressed with this app! Its user-friendly, runs smoothly, and has all the features I need. Makes my tasks so much easier and saves me a lot of time. Highly recommended!	5	2025-04-23	positive	0.8461	Google Play
1429	3	It's an amazing app, experience it!!	5	2025-04-23	positive	0.658	Google Play
1430	3	This is the best banking app ever. I recommend everyone to use it.	5	2025-04-23	positive	0.7717	Google Play
1431	3	It is the best application!!!	5	2025-04-22	positive	0.7249	Google Play
1432	3	Exceptional digital experience, SupperApp will bring new paradigm shift in the banking business. Bravo Dashen keep it up!!!!	5	2025-04-22	neutral	0	Google Play
1433	3	its features are so dynamic	5	2025-04-22	positive	0.5214	Google Play
1434	3	fast &Friendly user Application.	5	2025-04-22	neutral	0	Google Play
1435	3	Fast, Reliable and User Friendly. Keep it Up	5	2025-04-22	positive	0.4939	Google Play
1436	3	#dashen super app is easy to use, secure & fast transaction	5	2025-04-22	positive	0.8481	Google Play
1437	3	i love this app esp 3 click that make e-commerce easier and convinient.	5	2025-04-22	positive	0.7906	Google Play
1438	3	Great for everyday banking and payments on the go	5	2025-04-22	positive	0.6249	Google Play
1439	3	"Dashen Super App'' is impressive with its focus on simplicity, speed, and quality. The user interface is clean and easy to understand. Transactions process quickly, and the overall quality of the app is top-notch. A must-have for Dashen Bank customers.	5	2025-04-22	positive	0.9153	Google Play
1440	3	making transactions has never been easier. the new update is just amazing	5	2025-04-22	positive	0.3544	Google Play
1441	3	The app has various usefull functions, which make easy the payment system. Also, it will connect with sellers having reasonable prices.	5	2025-04-22	positive	0.4404	Google Play
1442	3	The app has great user interface with comprehensive payments and E-commerce platforms. And also it includes unique features such as chat Banking and budget.	5	2025-04-22	positive	0.7269	Google Play
1443	3	It is an amazing application that meets the needs of customers.	5	2025-04-22	positive	0.5859	Google Play
1444	3	Effecting payment via the app has created convenience to the recipients in easily confirming the payments received!	5	2025-04-22	positive	0.5707	Google Play
1445	3	the best Supper App ever	5	2025-04-22	positive	0.6369	Google Play
1446	3	This is the best app ever, when is it planned to include digital lending and gasification?	5	2025-04-22	positive	0.6369	Google Play
1447	3	A powerful, local solution that rivals any global app. I love how easy it is to explore services and products.	5	2025-04-22	positive	0.9042	Google Play
1448	3	Dashen bank is my number one choice	5	2025-04-22	positive	0.0772	Google Play
1449	3	Assefa Genetu = Dashen superup is the latest and inclussive .I am happy with this super up.	5	2025-04-22	positive	0.8225	Google Play
1450	3	The App is incredibly user-friendly and brings multiple services into one place. It's fast, intuitive, and makes daily tasks super convenient. A true all-in-one solution!	5	2025-04-21	positive	0.8516	Google Play
1451	3	Proudly made in Ethiopia, this innovation delivers more than promised. The marketplace is a major boost for local commerce	5	2025-04-21	positive	0.9017	Google Play
1452	3	it so fanrastic and user friendly app. Bravo Dashen bank thanks.	5	2025-04-21	positive	0.7269	Google Play
1453	3	one of the best digital platforms I've used! from smooth transactions to a seamless shopping experience, highly recommended.	5	2025-04-21	positive	0.7639	Google Play
1454	3	A proudly Ethiopia innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers bnd sellers	5	2025-04-21	positive	0.875	Google Play
1455	3	Dashen Super App is a game-changer! Its fast, user-friendly, and packed with features that make everyday banking and transactions super convenient. I love how everything I need from mobile banking to utility payments is all in one place. The interface is clean, and everything works smoothly. Definitely one of the best apps out there. Highly recommended!	5	2025-04-21	positive	0.9758	Google Play
1456	3	Easy to use and has many options. It is the best financial app I have ever used.	5	2025-04-21	positive	0.7964	Google Play
1457	3	Highly impressed! Dash Bank really nailed it with this app. Secure, reliable, and packed with features I use daily	5	2025-04-21	positive	0.7257	Google Play
1458	3	One of the best digital platforms Ive used! From smooth transactions to a seamless shopping experience, Highly recommended	5	2025-04-21	positive	0.7639	Google Play
1459	3	The user experience is seamless, and everything just works perfectly right out of the box. I cant believe how much time and effort it saves me every day.	5	2025-04-21	positive	0.6369	Google Play
1460	3	wa what nice super app !!keep it up dashen bank !!	5	2025-04-21	positive	0.8346	Google Play
1461	3	Dashen SuperApp the ultimate all-in-one solution! From banking and shopping to bill payments, everything you need is right at your fingertips. Life just got a whole lot easier!	5	2025-04-21	positive	0.6892	Google Play
1462	3	It is,really super because of its unique offerings to individuals and businesses.It is a secure UX first app intended to cater comprehensive digital meeds.I am also happy to know that Dashen is considering to make the app more inclusive by lowering the mobile version requirements .	5	2025-04-21	positive	0.8669	Google Play
1463	3	the very easy, secured, fast and multifunctional dashen supper application I ever seen. dashen really one steps ahead!!!	5	2025-04-21	positive	0.7934	Google Play
1464	3	One app for everything! I can shop, manage my bank account , and do so much more . Truly a super app	5	2025-04-21	positive	0.8371	Google Play
1465	3	one of the best digital platforms Ive used! From smooth transactions to a seamless shopping experie	5	2025-04-21	positive	0.6696	Google Play
1466	3	Dashen Bank super App is the most suitable, reliable, and fast digital banking system.	5	2025-04-21	positive	0.5994	Google Play
1467	3	This is what we call banking app. As professional I want banking app as simple as this and an app rich of features that align with my lifestyle.	5	2025-04-21	positive	0.5994	Google Play
1468	3	Super Easy To Use and Fast Transaction.	5	2025-04-21	positive	0.7783	Google Play
1469	3	I have an incredible experience with Dashen super app, what an amazing platform is it?. keep pioneering in technological advancement	5	2025-04-21	positive	0.8271	Google Play
1504	3	It is a very user friendly, attractive user interface, full of useful features. I really encourage everyone to give it a try.	5	2025-04-21	positive	0.9207	Google Play
1505	3	Good actually , but it have to WORK when developer option is on	5	2025-04-21	positive	0.2382	Google Play
1534	3	Dashen supper app is the most special. !!!!	5	2025-04-21	positive	0.6323	Google Play
1470	3	i can't recommend the Dashen Super App enough! This app is truly a game changer for anyone looking for a seamless and efficient way to manage their daily life. It combines multiple essential services into one easy-to-use platform, saving time and simplifying tasks The user interface is modern, intuitive, and super responsive, making navigation a breeze. Whether it's banking, payment services, or accessing lifestyle features, everything is just a few clicks away!!	5	2025-04-21	positive	0.941	Google Play
1471	3	The app is incredibly handy for managing multiple financial tasks, from bill payments to managing budgets. Its saved me a lot of time and made banking way more convenient. Definitely worth checking out!	5	2025-04-21	positive	0.8039	Google Play
1472	3	The new e-commerce feature is incredibly amazing and user friendly.	5	2025-04-21	positive	0.807	Google Play
1473	3	dashen bank supper app is the most easy to use and have high speed,quality and I like features like chat,budget,fuel payment, and security for my opinion this product is techonolgy edge,this international standard thanks for product oweners (dashen bank)	3	2025-04-21	positive	0.9099	Google Play
1474	3	The Dashen supperapp is a revolutionary advancement in digital banking, combining exceptional usability, an intuitive interface and a seamless user experience. among its standout features are the integration of QR codes, account statement, transaction advise, chat, transaction authentication for limit thresholds, budgeting and different app in a single dashboard. Truly ahead of the curve ..... keep up the excellent work	5	2025-04-21	positive	0.765	Google Play
1475	3	A proudly Ethiopian innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers and sellers. Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants!	5	2025-04-21	positive	0.945	Google Play
1476	3	Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants.	5	2025-04-21	positive	0.7089	Google Play
1477	3	Dashen Bank Super App is fast, reliable, and super easy to use. All my banking needs are handled smoothly in one place. Clean design and seamless experience highly recommended!	5	2025-04-21	positive	0.9412	Google Play
1478	3	Db sup app is A platform or an application that can grasp more satisfactions through fastest mode of operation which means for budget planning, to use QR code(scan, pay, go) chat with staff, acc to acc other bank ft, merchant payment, and easly. I addition to i satisfied and i invite everyone to use those platform!!.	5	2025-04-21	positive	0.7892	Google Play
1479	3	the chat banking and unique and only app that alow money request!!	5	2025-04-21	neutral	0	Google Play
1480	3	Better and inclusive app!	5	2025-04-21	positive	0.4926	Google Play
1481	3	It keep my time to pay my bills and I generate my satment easily	5	2025-04-21	positive	0.25	Google Play
1482	3	It's an amazing app that is up-to-date with the times, wow wow	5	2025-04-21	positive	0.9081	Google Play
1483	3	A game-changing Ethiopian innovationwhere shopping meets opportunity. The marketplace feature connects buyers and sellers like never before.	5	2025-04-21	positive	0.6486	Google Play
1484	3	Dashen Super App isnt just an app its an experience. Effortless, powerful, and built for the future	5	2025-04-21	positive	0.7717	Google Play
1485	3	This Is An Amazing App with Uniqe Quality,Easy And Fast Mobile Banking App.	5	2025-04-21	positive	0.5859	Google Play
1486	3	Dashen SuperApp is a lifesaver! Banking, shopping, and bills in one super easy app. The new e-commerce feature is awesome and supports local merchants. Fast, secure, and proudly Ethiopian.Download it nowyou wont regret it!	5	2025-04-21	positive	0.9779	Google Play
1487	3	Dashen SuperApp blends finance, shopping, and daily services effortlessly. The new e-commerce feature is smooth and supports local merchantsproud to back an Ethiopian-made solution!	5	2025-04-21	positive	0.6239	Google Play
1488	3	A solid step forward by Dashen Bank. The SuperApp combines essential banking features with lifestyle services, making everything accessible in one place. The interface is smooth, and transactions are quick and reliable. Its clear a lot of thought went into the design and functionality. Great job!	5	2025-04-21	positive	0.8221	Google Play
1489	3	Dashen bank super app is the crucial and convenient app in Ethiopia. there is no other app to compare with Dashen bank super app	5	2025-04-21	positive	0.765	Google Play
1490	3	All-in-one finance & e-commerce super app! Pay, save, shop seamlessly. Fast, secure. #BankAndShop	5	2025-04-21	positive	0.8553	Google Play
1491	3	it's a hestorical app. in the bank industry.	5	2025-04-21	neutral	0	Google Play
1492	3	A game changer in Ethiopian digital banking fast, secure, and packed with services. Everything you need, all in one powerful app. A true leap toward financial convenience and innovation!	4	2025-04-21	positive	0.8718	Google Play
1493	3	Banking, but make it smart. Local solutions, all in one place. Smooth, fast, and actually saving time. Feels like the future. Love it!	5	2025-04-21	positive	0.9427	Google Play
1494	3	All in one, that is it	5	2025-04-21	neutral	0	Google Play
1495	3	, Dashen Bank Supper App is multipurpose, convenient, very attractive and Make life easier	5	2025-04-21	positive	0.7178	Google Play
1496	3	very easy and flexible app.	5	2025-04-21	positive	0.6549	Google Play
1497	3	I choose Dashen Bank Super Up since, it is easy to use & it has attractive features !	5	2025-04-21	positive	0.8748	Google Play
1498	3	dashen super app is simple faster and reliable.	5	2025-04-21	positive	0.5994	Google Play
1499	3	Dashen Bank Super App is a game-changer! The user-friendly design, wide range of services, and smooth performance make it incredibly convenient for everyday banking. Its fast, secure, and truly reflects the banks commitment to digital excellence. Highly recommended!	5	2025-04-21	positive	0.9557	Google Play
1500	3	The app keeps getting better with every update! Smooth performance, great UI, and top-notch security. Thank you for making banking so convenient!"	5	2025-04-21	positive	0.9097	Google Play
1501	3	this app is the most simply to use and secure safe i love it to use for any bank transaction	5	2025-04-21	positive	0.8591	Google Play
1502	3	After i download the app recently had a smooth expriance, its user friendly, fast, and everything works as expected. keep up the good work.	5	2025-04-21	positive	0.7269	Google Play
1503	3	An app with High performance and advanced features!	5	2025-04-21	positive	0.3164	Google Play
1506	3	All-in-one convenience, From managing accounts to paying bills and shopping online and the chat banking is game changer, this app does it all seamlessly.	5	2025-04-21	neutral	0	Google Play
1507	3	I appreciate that Dashen Bank takes lifestyle services into account.	5	2025-04-21	positive	0.4019	Google Play
1508	3	amazing app really i loved it .that's why we say dashen bank is one stap ahead. It's the best mobile application that should be on every phone.	5	2025-04-21	positive	0.9216	Google Play
1509	3	very comfortable app keep it	5	2025-04-21	positive	0.5563	Google Play
1510	3	it has clear detail information about the application so it helps customer how to use the app. and it is very easy to use and also app is secure.	5	2025-04-21	positive	0.8771	Google Play
1511	3	I have been using the Dashen Supper app mobile banking app , and overall, I appreciate its features.However,Ive noticed that when I turn on the developer options on my device, the app stops functioning properly. It would be great if you could look into this issue, as I often need to access developer settings for other applications . Thank you for your attention to this matter!	5	2025-04-21	positive	0.8449	Google Play
1512	3	easiness to use with fast response time	5	2025-04-21	positive	0.3818	Google Play
1513	3	The new mobile banking application is a major upgrade! Its incredibly user-friendly, with a clean and modern design that makes navigation simple and intuitive. I really appreciate how fast it loads and how smooth the overall experience is. All essential services like balance checks, transfers, and bill payments are eas y to find and use. The added security features give me peace of mind, and the app runs reliably without crashes or glitches. Its clear a lot of thought went into the user experi	5	2025-04-21	positive	0.9455	Google Play
1514	3	As an Internal Customer, Dashen Bank SuperApp has greatly simplified my online banking experience. It's easy to use, allowing me to quickly check balances, transfer money and pay Bills. The app's advanced security features are highly secure, ensuring my data is well protected. The Three click, Chat Banking and IPS features have also given me a smarter experience. In deed Dashen Bank is always steping ahead!	5	2025-04-21	positive	0.9536	Google Play
1515	3	A truly impressive app user-friendly and a game-changer in Ethiopian banking. The Dashen Super App stands out as one of the most innovative and convenient digital banking solutions in Ethiopias financial history. Smooth navigation, seamless features, and a wide range of services all in one place. Well done!	5	2025-04-21	positive	0.9467	Google Play
1516	3	dashen bank super up has very fast and convenience and also it has contain more things on one app .I am very interesting to use dashen bank super up	5	2025-04-21	positive	0.8955	Google Play
1517	3	The Dashen Bank Super App has truly elevated my mobile banking experience. It's fast, user-friendly, and packed with all the essential features. The interface is clean and intuitive, making navigation easy even for first-time users. I also appreciate the added security features that give me peace of mind while banking on the go. Dashen Bank has done an amazing job with this appits reliable, efficient, and always improving. Highly recommended for anyone looking for seamless digital banking!	5	2025-04-21	positive	0.9846	Google Play
1518	3	A fantastic product!! keep the good work.	5	2025-04-21	positive	0.7955	Google Play
1519	3	I am very impressed with the Dashen super app. It is user-friendly and operates efficiently. The budget and chatbot features are impressive, and all items can be purchased with just three clicks.	5	2025-04-21	positive	0.923	Google Play
1520	3	The Dashen Super App offers a quick and user-friendly experience, bringing together a variety of services, like budgeting, payments, airtime recharges, and more, all in one convenient platform. Its sleek design and intuitive navigation ensure effortless transactions. It's evident that Dashen Bank has carefully crafted the app to make everyday financial activities easier. A great choice for anyone aiming to streamline their digital routines!	5	2025-04-21	positive	0.9493	Google Play
1521	3	Dashen supper App is the most useful app for our customers	5	2025-04-21	positive	0.4927	Google Play
1522	3	it is the most amazing mobile app	5	2025-04-21	positive	0.624	Google Play
1523	3	A Good and fast supper app thanks for dashen bank	5	2025-04-21	positive	0.7003	Google Play
1524	3	Dear Users of the Dashen Bank Super App,I have been using the Dashen Bank Super App for a while now, and I must sayits truly a game-changer! The app is incredibly fast and reliable; Ive never encountered any delays with my transactions. One feature I absolutely love is Chat Banking. It makes everyday tasks like checking my balance or transferring money as simple as sending a quick message. Also, the budgeting tool has been a huge help in tracking my spending and giving me a clearer	5	2025-04-21	positive	0.9798	Google Play
1525	3	Dashen Bank Super Up,use the app and makes your easy,fast,convinent.	5	2025-04-21	positive	0.5994	Google Play
1526	3	To join digital world use supper app and make your life easy	5	2025-04-21	positive	0.6249	Google Play
1527	3	best mobile banking application	5	2025-04-21	positive	0.6369	Google Play
1528	3	This banking superapp is incredibly well designed. The design and appearance of the app and the overall experience I have when using the app is fantastic. The app is packed with features from banking to e-commerce all in one place.It even has a budget setting option which is super useful for managing my money. Everything runs smoothly and I love how convenient it has made my daily life. Huge Kudos to Dashen Bank. You are truly living up to the motto ''Always one step ahead." Keep it up!	5	2025-04-21	positive	0.9771	Google Play
1529	3	best mobile banking application	5	2025-04-21	positive	0.6369	Google Play
1530	3	I was really amazed by the idea of an e-commerce service on a banking app. This is what it means to be one step ahead. Please include all kinds of products in there as soon as possible.	5	2025-04-21	positive	0.6997	Google Play
1531	3	this is what we expect to get service Dashen Bank always like his slogan	5	2025-04-21	positive	0.3612	Google Play
1532	3	Dashen SupApp is the most contemporary application, offering a great experience by enabling users to perform multiple tasks through a single platformsuch as chatting with friends, transferring money, paying bills, and more. It is the first app of its kind in the Ethiopian banking industry, making it a remarkable opportunity for entrepreneurs working in app-based sales and software marketing. Good job, Dashen Bank!	5	2025-04-21	positive	0.9647	Google Play
1533	3	Dashen Super App gives me an amazing convenience and makes life easy.	5	2025-04-21	positive	0.891	Google Play
1535	3	I really like this amazing application and Dashen Supper app that has made my life easier.	5	2025-04-21	positive	0.8866	Google Play
1536	3	amazing features, faster and easy to use	5	2025-04-21	positive	0.7717	Google Play
1537	3	The Dashen Super App offers a modern, user-friendly experience that leverages the latest technological advancements to deliver a seamless e-commerce platform	5	2025-04-21	positive	0.5994	Google Play
1538	3	I love it. one of the best mobile banking app in the banking industry	5	2025-04-21	positive	0.8555	Google Play
1539	3	no working for me hulum information asgebiche continue or accept yemilew button ayeseram my phone is Samsung A51	1	2025-04-21	positive	0.1027	Google Play
1540	3	waw no idea the best app.	5	2025-04-19	positive	0.4588	Google Play
1541	3	Feature-rich? Absolutely. But the speed? Painfully slow. Seriously, is it communicating with a server on Mars or something?	5	2025-04-16	negative	-0.8014	Google Play
1542	3	The Dashen Super App delivers a remarkably fast, highly secure, and exceptionally user-friendly experience, establishing it as a leading application in its category.keep it up and stay ahead Dashen Bank.	5	2025-04-14	positive	0.7818	Google Play
1543	3	So far so good! their in person customer service is amazing	5	2025-04-14	positive	0.8467	Google Play
1544	3	The app is very backward and doesn't always work. If it works three hours out of 24 hours it's great!	1	2025-04-14	positive	0.6588	Google Play
1545	3	It's bad for the connection and too many days are it that not working	1	2025-04-12	negative	-0.5423	Google Play
1546	3	The app is not working properly, I have been using it.	1	2025-04-10	neutral	0	Google Play
1547	3	I had a disappointing experience with Dashen Bank's Super Up service. The app is very slow and takes forever to load during transactions, which is incredibly frustrating. Additionally, it doesn't generate receipts for any transactions, making it difficult to keep track of my expenses. I also reached out to customer support, but the response time was longer than expected. Overall, I was hoping for a better experience, but I find the service lacking and in need of improvement.	2	2025-04-09	positive	0.9022	Google Play
1548	3	It's slow to send OTP. it's not reliable. It crushed many times. It needs improvement in many ways	1	2025-04-07	positive	0.6522	Google Play
1549	3	This is the worst mobile banking experience Ive ever had. It doesnt work when you need it, and it randomly updates itself without warning. You cant make transactions whenever you want. Its a nightmare for anyone who relies on this as their main banking option, especially those with a lot of money in their account. Im lucky Im not one of them, but still, its infuriating not being able to access your money when you need it."l	1	2025-04-07	negative	-0.679	Google Play
1550	3	I have experienced on using the app of Banks in Ethiopia, this Dashen sup is like old version of the applications for using. I gave 3 star for it's very low speed while login and processing	3	2025-04-07	neutral	0.0276	Google Play
1551	3	This app is not working unless you turn off developer mode on your phone. So it takes your rights to just use it.	2	2025-04-04	neutral	0	Google Play
1552	3	it's very disappointing fix it as soon as possible not expected from dashin bank fix it	1	2025-04-04	negative	-0.5413	Google Play
1553	3	why dashen bank workers hidden my ATM Card ?it's a big problem to me	5	2025-04-04	negative	-0.4019	Google Play
1554	3	why does it ask me for both pin and opt even the opt is touch let alone both	2	2025-04-02	negative	-0.25	Google Play
1555	3	it is best app easy to use	5	2025-04-01	positive	0.7964	Google Play
1556	3	It is very easy to use and powerful application.	3	2025-04-01	positive	0.7178	Google Play
1557	3	this apps have a good feature but but some features like developer mode turn off irritate user	3	2025-04-01	positive	0.128	Google Play
1558	3	This is not only a mobile banking app, it is beyond that. We will access our account easily, we are able to get many information easily here. i.e. exchage rate. We are able to chat with others, we are able to budget, we are able to transfer to other bank and within Dashen. we are able to access many accounts in a single app, we are able to pay bills in QR scan, we are able to make payments and order delivery items here in a single app. #Always one step ahead.	5	2025-03-31	positive	0.5267	Google Play
1559	3	wallahi very fantastic Bank	5	2025-03-31	positive	0.5984	Google Play
1560	3	Waw, It's amazing app. thank you Dashen Bank.	5	2025-03-31	positive	0.743	Google Play
1561	3	Ive been using the Dashen Bank Super App for a while now, and its been a game-changer. The app is super fast and reliableIve never had an issue with transactions being delayed. One of my favorite features is the chat banking, which makes it so easy to do things like check my balance or transfer money just by typing a quick message. The budgeting tool is also really useful. It helps me keep track of my spending and gives me a clear picture of where	5	2025-03-28	positive	0.9744	Google Play
1562	3	Very good app that like it too. B/c it is very fast and easy to use.	5	2025-03-26	positive	0.8341	Google Play
1563	3	thanks for all digital transaction	5	2025-03-21	positive	0.4404	Google Play
1564	3	This app is not supporting smart phones that have old android version and so it is none inclusive. At the same time the amole lite is not working properly and once you reached to maximum otp trail mistakes due to network or other errors like stacks , you will be tied up to make Transactions. Ohh... tired!!!!!	1	2025-03-20	negative	-0.7803	Google Play
1565	3	it's Be Come Busy &not working good	1	2025-03-20	positive	0.4404	Google Play
1566	3	I wanted to share some concerns about your Supper App. It appears to be experiencing reliability issues and isnt performing as expected. I hope this can be addressed soon to improve the user experience. One star for now.	1	2025-03-19	positive	0.7906	Google Play
1567	3	best ever digital banking sector essay for understanding ,smart and convince for using	5	2025-03-19	positive	0.836	Google Play
1568	3	This app is the most unreliable mobile banking application I have ever used for transaction, it is very late, non-responsive and full of bugs. Its is very disappointing. It is just inconvinient, and not user friendly and compatabke at all !!!!!!	1	2025-03-14	negative	-0.8068	Google Play
1569	3	The app is good but it has no USSD option	4	2025-03-13	negative	-0.2144	Google Play
1570	3	I have used many mobile banking and also tellebir and mpesa nothing come close to this app. Well done Dashen indeed one step a head. A lot of cool features that amole hasn't the receipt and the account statement is superb for me. I hope you add more integrated small apps to.	5	2025-03-12	positive	0.886	Google Play
1571	3	The app is good but it ask update every week so tiring	2	2025-03-11	positive	0.2382	Google Play
1572	3	It good and easy to use	5	2025-03-11	positive	0.7003	Google Play
1573	3	Greately improved since it was released! I really like the budget and expense tegistration feature. For ATM or POS withdrawals, it is not possible to account these expenses, even if it is visible on the transactions window. If that can be worked on, it will be improve so much!!	5	2025-03-10	positive	0.8648	Google Play
1574	3	Nice app but i experience some issues with others banks transfer it keeps saying account is not exist most of the time.	4	2025-03-08	positive	0.2263	Google Play
1575	3	Add the option to send money to any telebirr account like amole does.	3	2025-03-08	positive	0.3612	Google Play
1576	3	In short ! I'm so proud of this app developers for their highest professional of developing. Thanks	5	2025-03-06	positive	0.8011	Google Play
1577	3	The speed is too slow. Need some improvements.	2	2025-03-06	positive	0.3182	Google Play
1578	3	I wish dark mode feature is add as an option but it's good app	5	2025-02-27	positive	0.6908	Google Play
1579	3	The Dashen Super App is a game-changer in digital banking, offering a seamless and convenient experience. With its user-friendly interface, fast transactions, and a wide range of financial services, it simplifies banking for customers. Features like bill payments, fund transfers, mobile top-ups, and loan applications make it an all-in-one solution. Plus, its security measures ensure safe and reliable Experiance effortless banking	5	2025-02-26	positive	0.9393	Google Play
1580	3	It has good feature. But, it is Very Slow! difficult to pay or receive. The Speed should be improved, else I didn't recommend.	2	2025-02-24	negative	-0.2788	Google Play
1581	3	best platform... Please avoid otp	5	2025-02-21	positive	0.6486	Google Play
1582	3	I don't know what happens but the application is not send verification pass code you should fix that	1	2025-02-16	neutral	0	Google Play
1583	3	This app doesn't work on my phone my phone is Samsung Galaxy s7 android version 9 All other financial apps work like telebirr CBE M_pesa...	1	2025-02-14	positive	0.3612	Google Play
1584	3	Dashen Super app is secure, very easy to use and has more services uniquely like budgeting, chat, IPS...	5	2025-02-14	positive	0.9053	Google Play
1585	3	Amazing and user friendly supper app and looking forward the additional features	5	2025-02-14	positive	0.7906	Google Play
1586	3	Keep up the good work and pleas add water and electric utility payment	5	2025-02-12	positive	0.4404	Google Play
1587	3	The app missed some important features 1. It does't show recent transactions 2. Transfer to Telebirr limited to own telebirr 3. The statement does't show running balance	2	2025-02-11	negative	-0.3182	Google Play
1588	3	Simple, Fast and Easy	4	2025-02-10	positive	0.4404	Google Play
1589	3	#Dashen Super App; Super easy to use, secure, and fast transaction. Love it!	5	2025-02-07	positive	0.9558	Google Play
1590	3	I tried the new Dash Bank Super App today, and it's amazingly easy and fun.I recommend you download and use it. You really like it	5	2025-02-06	positive	0.9079	Google Play
1591	3	On Transaction page only show sent Transaction. Try to include received transaction.	4	2025-02-06	neutral	0	Google Play
1592	3	Wonderful Application	5	2025-02-05	positive	0.5719	Google Play
1593	3	I am so thankful for having this best app Dashen one step ahead	5	2025-02-04	positive	0.8748	Google Play
1594	3	Excellent app ever but it needs improvement on speed and transaction lists	1	2025-02-03	positive	0.7469	Google Play
1595	3	It does not work functional ,	1	2025-02-02	neutral	0	Google Play
1596	3	all of dashen bank customers use the application it is good to use	5	2025-02-01	positive	0.4404	Google Play
1597	3	Dashen super app is easy to use, fast and robust	5	2025-01-31	positive	0.8481	Google Play
1598	3	it was amazing app.....thank you dashen bank....	5	2025-01-30	positive	0.5859	Google Play
1599	3	Excellent UI/UX and beyond Banking services	5	2025-01-30	positive	0.5719	Google Play
1600	3	Send to oher bank addisinternational bank cbe birr account number	2	2025-01-29	positive	0.0772	Google Play
1601	3	mobile banking to the next level	5	2025-01-28	neutral	0	Google Play
1602	3	The first 3 star review is me	3	2025-01-25	neutral	0	Google Play
1603	3	Fast, reliable and user friendly. Amazing chatting features. Keep it up! Always one step ahead!	5	2025-01-24	positive	0.8217	Google Play
1604	3	This app is literally the best thing ever The chat banking is so easy just text and its done Super smooth, fast, and honestly a life saverIf you havent downloaded it yet youre missing out big time	5	2025-01-23	positive	0.9279	Google Play
1605	3	I only see white page	2	2025-01-23	neutral	0	Google Play
1606	3	Excellent banking app for all your needs! Who needs a physical branch when you can use Dashen Bank Super App Instead! I've never had an issue with anything that Dashen Bank Super App haven't handled swiftly and resolved to my satisfaction and above I don't often write reviews but this is an app/bank that I would highly recommended to everyone	5	2025-01-22	positive	0.8842	Google Play
1607	3	Fastest and easy to use	5	2025-01-22	positive	0.4404	Google Play
1608	3	Exellent app with exellent banking system and exellent bank ever	5	2025-01-21	neutral	0	Google Play
1609	3	Amazing app to use as usual! But why option of transferring to Telebirr and M pesa which was available on Amole app is omitted?? Dasheen is my favourite keep it up.	4	2025-01-20	positive	0.4682	Google Play
1610	3	I hope it will be better than amole	5	2025-01-18	positive	0.7003	Google Play
1611	3	Wly Super App ilove it	5	2025-01-18	positive	0.5994	Google Play
1612	3	Dashen yichalal. Ewnetem one step a head	5	2025-01-17	neutral	0	Google Play
1613	3	It has a Good performance but need more upgrade for more performance like when we login account not be fast balance show other thing looking good. Carry on. Thanks so much for Greatest service	4	2025-01-17	positive	0.9662	Google Play
1614	3	It is a very wonderful work that has saved its time. That is why it is "Always one step ahead!"	5	2025-01-17	positive	0.7955	Google Play
1615	3	Life-changing! I cant imagine going back to traditional banking after using this app. Its so convenient.	5	2025-01-17	neutral	0	Google Play
1616	3	The most good app and easy	5	2025-01-16	positive	0.7264	Google Play
1617	3	Excellent and user friendly App. Excellence is what makes you always one step ahead. Dashen Bank, Always One Step Ahead !!	5	2025-01-16	positive	0.9115	Google Play
1618	3	Proud to be dashen family . Shout out to the serial entrepreneur	5	2025-01-16	positive	0.4767	Google Play
1619	3	First ATM in East africa	5	2025-01-16	neutral	0	Google Play
1620	3	Better Move to catch the competition up	5	2025-01-16	positive	0.4404	Google Play
1621	3	Great job my home, my bank.	5	2025-01-16	positive	0.6249	Google Play
1622	3	I love it but it has bugs during confirmation of password! So, please make it functional	5	2025-01-15	positive	0.7416	Google Play
1623	3	Always one step forward	5	2025-01-15	neutral	0	Google Play
1624	3	It's great! But it will be advanced if you include a caption that allow customers to transfer to Telebirr account. Dashen Bank, " " (Always one step ahead!)	4	2025-01-15	positive	0.7896	Google Play
1625	3	Small size with vast features and functionalities.	5	2025-01-15	neutral	0	Google Play
1626	3	Amazing app Dashen bank one step a head	5	2025-01-15	positive	0.5859	Google Play
1627	3	It has a great application features from the beginning. I'm glad to use it even I haven't used it yet because I haven't activated my account yet. But it's simple, comprehensive, full of information, and fast. : The super app has impressed me more than I expected.	5	2025-01-15	positive	0.9481	Google Play
1628	3	Dashen Bank Always One Step Ahead!	5	2025-01-15	neutral	0	Google Play
1629	3	U can't create account	1	2025-01-15	negative	-0.2057	Google Play
1630	3	Really super app... so seamless and with a nice user interface .. we are proud of you dashen bank ...	5	2025-01-15	positive	0.8777	Google Play
1631	3	Always one step a head!	5	2025-01-15	neutral	0	Google Play
1632	3	A lightweight,catchy and smooth app	5	2025-01-15	neutral	0	Google Play
1633	3	Very impressive interface with best security feature and user friendly app.	5	2025-01-15	positive	0.9245	Google Play
1634	3	It is so far so good it has a unique features than telebirr good job Dashen	5	2025-01-15	positive	0.8459	Google Play
1635	3	Yea , it's a good idea to make it with the bank name, it will help for the bank easily to find the application, and customers can easily downloed and use the product. I wish all the best for Dashen bank initiative.	5	2025-01-15	positive	0.946	Google Play
1636	3	Dashen Bank Always One Step Ahead!	5	2025-01-14	neutral	0	Google Play
1637	3	Truly, db => AlwaysOneStepAhead !!	5	2025-01-14	positive	0.5399	Google Play
1638	3	oh nice!!! i wish it's very nice app	5	2025-01-14	positive	0.8472	Google Play
1639	3	Really the app looks like amazing. I can't wait to activate in the morning.	5	2025-01-14	positive	0.743	Google Play
1640	3	Applause Dashen Bank. One of the best super app inorder to pay easily and securely. One step a head.	5	2025-01-14	positive	0.936	Google Play
1641	3	The best Banking app I have ever seen	5	2025-01-14	positive	0.6369	Google Play
1642	3	It looks good and simple to use	5	2025-01-14	positive	0.4404	Google Play
1643	3	App That makes Difference!	5	2025-01-14	neutral	0	Google Play
1644	3	Waw Great and innovated,user friendly, always one step ahead	5	2025-01-13	positive	0.8074	Google Play
1645	3	Always one step ahead	5	2025-01-13	neutral	0	Google Play
1646	3	Like Me, I Hope It Works Better Than Before.	5	2025-01-11	positive	0.8074	Google Play
\.


--
-- Name: banks_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_bank_id_seq', 15, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1646, true);


--
-- Name: banks banks_bank_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_bank_code_key UNIQUE (bank_code);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (bank_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: reviews reviews_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.banks(bank_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict U8OCE13mw8nd8efoCWTt69enWX2774uxM7m7LiGh5wHBzkV9vpchkmnx3Zv3wA6

