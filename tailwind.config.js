/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{html,js,svelte,ts,md}'],
	theme: {
		extend: {
			colors: {
				parchment: '#F5EDD6',
				charcoal: '#2C2417',
				ochre: '#8B6914',
				'slate-covenant': '#5A6B7A',
				sage: '#6B7C5C'
			},
			fontFamily: {
				'serif-body': ['Lora', 'EB Garamond', 'Georgia', 'serif'],
				'serif-display': ['Playfair Display', 'Georgia', 'serif'],
				'serif-hebrew': ['Noto Serif Hebrew', 'SBL Hebrew', 'serif']
			}
		}
	},
	plugins: []
};
