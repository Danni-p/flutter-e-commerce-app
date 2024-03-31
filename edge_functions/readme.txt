// login to cli
npx supabase login

// list all projects
npx supabase projects list

// link to project
npx supabase link --project-ref your-project-id

// deploy
npx supabase functions deploy hello-world

// optional: without jwt check
npx supabase functions deploy hello-world --no-verify-jwt
